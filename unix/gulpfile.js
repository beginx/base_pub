var fs = require('fs');
var gulp = require('gulp');
var guppy = require('git-guppy')(gulp);
var plugins = require('gulp-load-plugins')();
var del = require('del');
var es = require('event-stream');
var bowerFiles = require('main-bower-files');
var print = require('gulp-print');
var concat = require('gulp-concat');
var Q = require('q');
var file = require('file');
var path = require('path');
var handlebars = require('gulp-compile-handlebars');
var replace = require('gulp-replace');
var bump = require('gulp-bump');
var args = require('yargs').argv;
var msg = '';

// == PATH STRINGS ========
var paths = {
    scripts: ['./app/**/*.js'],
    styles: [
                './bower_components/bootstrap/dist/css/bootstrap.min.css',
                './bower_components/ng-dialog/css/ngDialog.min.css',
                './bower_components/ng-dialog/css/ngDialog-theme-default.css',
                './bower_components/toastr/toastr.min.css',
                './bower_components/angular-material/angular-material.css',
                './assets/css/*.css'
        ],
    fonts: [
        './assets/css/ui-grid.eot',
        './assets/css/ui-grid.svg',
        './assets/css/ui-grid.ttf',
        './assets/css/ui-grid.woff',
        './assets/css/NanumGothic.eot',
        './assets/css/NanumGothic.woff',
        './assets/css/NanumGothic-Bold.eot',
        './assets/css//NanumGothic-Bold.woff'
        ],
    images: './assets/images/**/*',
    version: './app/app.constant.js',
    versionPath: './app/',
    default: './default.hbs',
    distIndex: 'default.html',
    distCss: 'style.min.css',
    partials: ['app/**/*.html'],
    distDev: './dist.dev',
    distProd: './dist.prod',
    distRoot: './',
    distScripts: './scripts',
    distStyles: './css',
    distImages: './images',
    distFonts: './css',
    distScriptsProd: './dist.prod/scripts',
    distStylesProd: './dist.prod/css'
};

var handlebarOpts  = {

    helpers: {
        assetPath: function (path, context) {
            return context.data.root[path];
        } 
    }
};

function getModules(src, app, ignore) {

    var modules = [];
    var temp = [];

    file.walkSync(src, function(dirPath, dirs, files) {

        if(files.length < 1)
            return;

        var dir = path.basename(dirPath),
        module;

        if(ignore.indexOf(dir) === -1) {
            module = dirPath === src ? app : dir;

            files = files.sort(function(a, b) {
                return path.basename(a, '.js') === module ? -1 : 1;
            })
                .filter(function(value) {
                    return value.indexOf('.') !== 0;
                })
                .map(function(value) {
                    return path.join(dirPath, value);
                })
            temp = files.filter(function(value) {
                return value.indexOf('app.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.module.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.constant.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.config.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
            	return value.indexOf('.version.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.provider.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.factory.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.service.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.controller.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.command.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.map.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.directive.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return value.indexOf('.model.js') !== -1;
            });
            modules = modules.concat(temp);
            temp = files.filter(function(value) {
                return (value.split('.').length === 2) && (value !== 'app.js');
            });
            modules = modules.concat(temp);
        }
    })

    return modules;
}

// == PIPE SEGMENTS ========

var pipes = {};

pipes.orderedVendorScripts = function() {
    return plugins.order(['jquery-2.1.4.js', 'angular.js', 'highcharts.js', 'moment.min.js']);
};

pipes.orderedAppScripts = function() {

    return  plugins.angularFilesort();
};

pipes.minifiedFileName = function() {
    return plugins.rename(function (path) {
        path.extname = '.min' + path.extname;
    });
};

pipes.validatedAppScripts = function() {
     var modules =  getModules('app', 'app', []);

    return gulp.src(modules)
       // .pipe(plugins.jshint())
        .pipe(plugins.jshint.reporter('jshint-stylish'));
};

pipes.builtAppScriptsDev = function() {
    return pipes.validatedAppScripts()
        .pipe(gulp.dest(paths.distDev));
};

pipes.builtAppScriptsProd = function() {
    var scriptedPartials = pipes.scriptedPartials();
    var validatedAppScripts = pipes.validatedAppScripts();

    return es.merge(scriptedPartials, validatedAppScripts)
        .pipe(plugins.sourcemaps.init())
        .pipe(plugins.concat('app.min.js'))
        .pipe(plugins.uglify({mangle: false, compress: { drop_console: true, global_defs: {DEBUG: false, VERSION:'0.1.0'} }}))
        .pipe(plugins.sourcemaps.write())
        .pipe(gulp.dest(paths.distScripts))
        .pipe(gulp.dest(paths.distScriptsProd));
};

pipes.builtVendorScriptsDev = function() {

    return gulp.src(bowerFiles())
        .pipe(gulp.dest('dist.dev/bower_components'));
};

pipes.builtVendorScriptsProd = function() {
    console.log(bowerFiles('**/*.js'));
    return gulp.src(bowerFiles('**/*.js'))
        .pipe(pipes.orderedVendorScripts())
        .pipe(plugins.concat('vendor.min.js'))
        .pipe(plugins.uglify({mangle: false}))
        .pipe(gulp.dest(paths.distScripts))
        .pipe(gulp.dest(paths.distScriptsProd));
};

pipes.validatedPartials = function() {
    return gulp.src(paths.partials);
       // .pipe(plugins.htmlhint({'doctype-first': false}))
       // .pipe(plugins.htmlhint.reporter());
};

pipes.builtPartialsDev = function() {
    return pipes.validatedPartials()
        .pipe(gulp.dest(paths.distDev));
};

pipes.scriptedPartials = function() {
    return pipes.validatedPartials()
        .pipe(plugins.htmlhint.failReporter())
        .pipe(plugins.htmlmin({collapseWhitespace: true, removeComments: true}))
        .pipe(plugins.ngHtml2js());
};

pipes.builtStylesDev = function() {
    return gulp.src(paths.styles)
        .pipe(gulp.dest(paths.distDev));
};

pipes.builtStylesProd = function() {

    return gulp.src(paths.styles)
        .pipe(plugins.sourcemaps.init())
        .pipe(plugins.minifyCss({processImport: false}))
        .pipe(plugins.sourcemaps.write())
        .pipe(pipes.minifiedFileName())
        .pipe(concat(paths.distCss))
        .pipe(gulp.dest(paths.distStyles))
        .pipe(gulp.dest(paths.distStylesProd));
};

pipes.processedImagesDev = function() {
    return gulp.src(paths.images)
        .pipe(gulp.dest(paths.distDev + '/images/'));
};

pipes.processedImagesProd = function() {
    return gulp.src(paths.images)
        .pipe(gulp.dest(paths.distProd + '/images/'))
        .pipe(gulp.dest(paths.distImages));
};
pipes.processedFontsProd = function() {
    return gulp.src(paths.fonts)
        .pipe(gulp.dest(paths.distProd + '/css/'))
        .pipe(gulp.dest(paths.distFonts));
};

pipes.validatedIndex = function() {
    return gulp.src(paths.distIndex)
        .pipe(plugins.htmlhint())
        .pipe(plugins.htmlhint.reporter());
};


pipes.builtIndexDev = function() {

    var orderedVendorScripts = pipes.builtVendorScriptsDev()
        .pipe(pipes.orderedVendorScripts());

    var orderedAppScripts = pipes.builtAppScriptsDev();

    var appStyles = pipes.builtStylesDev();

    return pipes.validatedIndex()
        .pipe(gulp.dest(paths.distDev)) // write first to get relative path for inject
        .pipe(plugins.inject(orderedVendorScripts, {relative: true, name: 'bower'}))
       // .pipe(plugins.inject(orderedAppScripts, {relative: true}))
        .pipe(plugins.inject(appStyles, {relative: true}))
        .pipe(gulp.dest(paths.distDev));
};

pipes.builtIndexProd = function() {

    var vendorScripts = pipes.builtVendorScriptsProd();
    var appScripts = pipes.builtAppScriptsProd();
    var appStyles = pipes.builtStylesProd();


    return pipes.validatedIndex()
        .pipe(plugins.htmlmin({collapseWhitespace: true, removeComments: true}))
        .pipe(gulp.dest(paths.distRoot))
        .pipe(plugins.inject(vendorScripts, {relative: true, name: 'bower'}))
        .pipe(plugins.inject(appScripts, {relative: true}))
        .pipe(plugins.inject(appStyles, {relative: true}))
        .pipe(plugins.htmlmin({collapseWhitespace: true, removeComments: true}))
        .pipe(gulp.dest(paths.distProd));
};

pipes.builtAppDev = function() {
    return es.merge(pipes.builtIndexDev(), pipes.builtPartialsDev(), pipes.processedImagesDev());
};

pipes.builtAppProd = function() {
    return es.merge(pipes.builtIndexProd(), pipes.processedImagesProd(), pipes.processedFontsProd());
};

// == TASKS ========
gulp.task('bump', function () {

    var type = args.type;
    var version = args.version;
    var options = {};
    if (version) {
        options.version = version;
        msg += ' to ' + version;
    } else {
        options.type = type;
        msg += ' for a ' + type;
    }
    console.log(msg);

    return gulp
        .src(['./package.json', './bower.json'])
        .pipe(bump(options))
        .pipe(gulp.dest(paths.distRoot));
});
gulp.task('increment-version',['site-url'],  function(){
    var docString = fs.readFileSync(paths.version, 'utf8');

    var versionNumPattern=/version: '(.*)'/; //version: '0.0.0',
    var vNumRexEx = new RegExp(versionNumPattern);
   
    var oldVersionNumber = (vNumRexEx.exec(docString))[1];

    var versionParts = oldVersionNumber.split('.');
    var vArray = {
        vMajor : versionParts[0],
        vMinor : versionParts[1],
        vPatch : versionParts[2]
    };

    vArray.vPatch = parseFloat(vArray.vPatch) + 1;
    var periodString = ".";

    var newVersionNumber = vArray.vMajor + periodString +
        vArray.vMinor+ periodString +
        vArray.vPatch;

    gulp.src([paths.version])
        .pipe(replace(/version: '(.*)'/g, "version: '" + newVersionNumber +"'"))
        .pipe(gulp.dest(paths.versionPath));
});
gulp.task('change-version-template',['bump','increment-version'], function() {
    var manifest = JSON.parse(fs.readFileSync('./package.json', 'utf8'));
    return gulp.src(paths.default)
        .pipe(handlebars(manifest, handlebarOpts))
        .pipe(plugins.concat(paths.distIndex))
        .pipe(gulp.dest(paths.distRoot));
});

var hostPattern=/HOST\s\:(.*)\,\/\/XXX/g;
var apiPattern=/API_PATH\s\:(.*)\,\/\/XXX/g;

gulp.task('site-pack-dev', function(){
    var docString = fs.readFileSync(paths.version, 'utf8');

//            개발 서버API
//            HOST :      'http://58.102.122.166:8090',
 //           API_PATH :  '/tros',

    gulp.src([paths.version])
        .pipe(replace(hostPattern, "HOST : 'http://58.102.122.166:8090',"))
        .pipe(replace(apiPattern, "API_PATH : '/tros',"))
        .pipe(gulp.dest(paths.versionPath));
//        .pipe(gulp.dest("./"));
});

gulp.task('site-pack-pg', function(){
    var docString = fs.readFileSync(paths.version, 'utf8');

//            판교 서버API
//            HOST :        'http://218.39.67.234:20030',
//            API_PATH :    ''

    gulp.src([paths.version])
        .pipe(replace(hostPattern, "HOST : 'http://218.39.67.234:20030',"))
        .pipe(replace(apiPattern, "API_PATH : '',"))
        .pipe(gulp.dest(paths.versionPath));
//        .pipe(gulp.dest("./"));
});

gulp.task('site-pack-tg', function(){
    var docString = fs.readFileSync(paths.version, 'utf8');

//            Tango 서버API
//            HOST :        getTangoCoreUri(),//'http://90.90.200.139:20030',
//            API_PATH :    '/tros0'

    gulp.src([paths.version])
        .pipe(replace(hostPattern, "HOST : getTangoCoreUri(),"))
        .pipe(replace(apiPattern, "API_PATH : '/tros0',"))
        .pipe(gulp.dest(paths.versionPath));
//        .pipe(gulp.dest("./"));
});

gulp.task('site-pack-br', function(){
    var docString = fs.readFileSync(paths.version, 'utf8');

//            보라매 서버API - tro3
//            HOST :        'http://10.40.100.82:8080',
//            API_PATH :    ''

    gulp.src([paths.version])
        .pipe(replace(hostPattern, "HOST : 'http://10.40.100.82:8080',"))
        .pipe(replace(apiPattern, "API_PATH : '',"))
        .pipe(gulp.dest(paths.versionPath));
//        .pipe(gulp.dest("./"));
});

gulp.task('site-pack-brl', function(){
    var docString = fs.readFileSync(paths.version, 'utf8');

//            보라매 서버API - tro3
//            HOST :        'http://58.102.122.57:10019',
//            API_PATH :    ''

    gulp.src([paths.version])
        .pipe(replace(hostPattern, "HOST : 'http://58.102.122.57:10019',"))
        .pipe(replace(apiPattern, "API_PATH : '',"))
        .pipe(gulp.dest(paths.versionPath));
//        .pipe(gulp.dest("./"));
});

gulp.task('site-url',  function() {
    var site = args.site;

    if(site === "dev") {
    	console.log('-- choice dev');
		gulp.run('site-pack-dev');
	}
	else if(site === "pg") {
    	console.log('-- choice pg');
		gulp.run('site-pack-pg');
	}
	else if(site === "tg") {
    	console.log('-- choice tg');
		gulp.run('site-pack-tg');
	}
	else if(site === "br") {
    	console.log('-- choice br');
		gulp.run('site-pack-br');
	}
	else if(site === "brl") {
    	console.log('-- choice brl');
		gulp.run('site-pack-brl');
	}
	else {
    	console.log('-- not choice dev');
		gulp.run('site-pack-dev');
	}
});


// removes all compiled dev files
gulp.task('clean-dev', function() {
    return deferred.promise;
});

// removes all compiled production files
gulp.task('clean-prod', function() {
    var deferred = Q.defer();
    del(paths.distProd, function() {
        deferred.resolve();
    });
    return deferred.promise;
});
// removes all compiled scripts files
gulp.task('clean-scripts', function() {
    var deferred = Q.defer();
    del(paths.distScripts, function() {
        deferred.resolve();
    });
    return deferred.promise;
});
// removes all compiled styles files
gulp.task('clean-styles', function() {
    var deferred = Q.defer();
    del(paths.distStyles, function() {
        deferred.resolve();
    });
    return deferred.promise;
});
// removes all compiled images files
gulp.task('clean-images', function() {
    var deferred = Q.defer();
    del(paths.distImages, function() {
        deferred.resolve();
    });
    return deferred.promise;
});


// checks html source files for syntax errors
gulp.task('validate-partials', pipes.validatedPartials);

// checks index.html for syntax errors
gulp.task('validate-index', pipes.validatedIndex);

// moves html source files into the dev environment
gulp.task('build-partials-dev', pipes.builtPartialsDev);

// converts partials to javascript using html2js
gulp.task('convert-partials-to-js', pipes.scriptedPartials);
 
// runs jshint on the app scripts
gulp.task('validate-app-scripts', pipes.validatedAppScripts);

// moves app scripts into the dev environment
gulp.task('build-app-scripts-dev', pipes.builtAppScriptsDev);

// concatenates, uglifies, and moves app scripts and partials into the prod environment
gulp.task('build-app-scripts-prod', pipes.builtAppScriptsProd);

// compiles app sass and moves to the dev environment
gulp.task('build-styles-dev', pipes.builtStylesDev);

// compiles and minifies app sass to css and moves to the prod environment
gulp.task('build-styles-prod', pipes.builtStylesProd);

// moves vendor scripts into the dev environment
gulp.task('build-vendor-scripts-dev', pipes.builtVendorScriptsDev);

// concatenates, uglifies, and moves vendor scripts into the prod environment
gulp.task('build-vendor-scripts-prod', pipes.builtVendorScriptsProd);

// validates and injects sources into index.html and moves it to the dev environment
gulp.task('build-index-dev', pipes.builtIndexDev);

// validates and injects sources into index.html, minifies and moves it to the dev environment
gulp.task('build-index-prod', pipes.builtIndexProd);

// builds a complete dev environment
gulp.task('build-app-dev', pipes.builtAppDev);

// builds a complete prod environment
gulp.task('build-app-prod', pipes.builtAppProd);

// cleans and builds a complete dev environment
gulp.task('clean-build-app-dev', ['clean-dev'], pipes.builtAppDev);

// cleans and builds a complete prod environment
gulp.task('clean-build-app-prod', ['clean-prod', 'clean-scripts',  'clean-styles',  'clean-images', 'change-version-template'], pipes.builtAppProd);

// clean, build, and watch live changes to the dev environment
gulp.task('watch-dev', ['clean-build-app-dev' ], function() {
 
 

    // watch app scripts
    gulp.watch(paths.scripts, function() {
        return pipes.builtAppScriptsDev()
            .pipe(plugins.livereload());
    });

    // watch html partials
    gulp.watch(paths.partials, function() {
        return pipes.builtPartialsDev()
            .pipe(plugins.livereload());
    });

    // watch styles
    gulp.watch(paths.styles, function() {
        return pipes.builtStylesDev()
            .pipe(plugins.livereload());
    });

});

// clean, build, and watch live changes to the prod environment
gulp.task('watch-prod', ['clean-build-app-prod' ], function() {
   
  
    // watch app scripts
    gulp.watch(paths.scripts, function() {
        return pipes.builtAppScriptsProd()
            .pipe(plugins.livereload());
    });

    // watch hhtml partials
    gulp.watch(paths.partials, function() {
        return pipes.builtAppScriptsProd()
            .pipe(plugins.livereload());
    });

    // watch styles
    gulp.watch(paths.styles, function() {
        return pipes.builtStylesProd()
            .pipe(plugins.livereload());
    });

});

// default task builds for prod
gulp.task('default', ['clean-build-app-prod']);
gulp.task('post-checkout', ['clean-build-app-prod']);
gulp.task('post-receive', ['clean-build-app-prod']);
