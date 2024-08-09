
// npm install --save-dev gulp-clean

var gulp = require('gulp');
var clean = require('gulp-clean');

var target_path='/Users/basie/Documents';

gulp.task('task_docs', function () {
	return gulp.src(['./Downloads/*.pptx', 
	 				'./Downloads/*.pdf',
	 				'./Downloads/*.ppt',
	 				'./Downloads/*.doc',
	 				'./Downloads/*.csv',
	 				'./Downloads/*.docx',
	 				'./Downloads/*.xls',
	 				'./Downloads/*.xlsx',
	 				'./Downloads/*.txt',
	 				'./Downloads/*.text',
	 				'./Downloads/*.hwp'])
	.pipe(clean({force: true}))
	.pipe(gulp.dest(target_path + '/Etc'));
});

gulp.task('torrent', function () {
	return gulp.src('~/Downloads/*.torrent')
	.pipe(clean({force: true}))
	.pipe(gulp.dest(target_path + '/Torrent'));
});

gulp.task('Raw', function () {
	return gulp.src(['./Downloads/*.exe',
	 				'./Downloads/*.zip',
	 				'./Downloads/*.gz',
	 				'./Downloads/*.jar',
	 				'./Downloads/*.rar',
	 				'./Downloads/*.tar',
	 				'./Downloads/*.pkg',
	 				'./Downloads/*.dmg',])
	.pipe(clean({force: true}))
	.pipe(gulp.dest(target_path + '/Public/Raw'));
});

gulp.task('Movies', function () {
	return gulp.src(['./Downloads/*.mp4' ])
	.pipe(clean({force: true}))
	.pipe(gulp.dest(target_path + '/Movies'));
});

gulp.task('Pictures', function () {
	return gulp.src(['./Downloads/*.jpg', 
	 				'./Downloads/*.gif',
	 				'./Downloads/*.jpeg',
	 				'./Downloads/*.mp4',
	 				'./Downloads/*.PNG',
	 				'./Downloads/*.png'])
	.pipe(clean({force: true}))
	.pipe(gulp.dest(target_path + '/Pictures'));
});

//gulp.task('default', ['task_docs', 'torrent', 'binary', 'images']);
gulp.task('default', ['task_docs', 'Raw', 'Pictures', 'Movies']);
