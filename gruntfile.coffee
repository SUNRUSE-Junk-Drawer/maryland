module.exports = (grunt) ->

	grunt.loadNpmTasks module for module in [
			"grunt-contrib-clean"
			"grunt-contrib-copy"
			"grunt-contrib-coffee"
			"grunt-jasmine-nodejs"
			"grunt-contrib-watch"
		]

	grunt.initConfig
		watch:
			build:
				options:
					atBegin: true
				files: ["src/**", "gruntfile.coffee"]
				tasks: ["build"]
		clean:
			dist: "dist"
			build: "build"
		copy:
			dist: 
				files: [
						cwd: "build"
						src: ["**/*.js", "!**/*.unit.js"]
						dest: "dist"
						expand: true
				]
		coffee:
			build:
				options:
					bare: true
				files: [
						cwd: "src"
						ext: ".js"
						src: ["**/*.coffee", "!**/*.unit.coffee"]
						dest: "build"
						expand: true
					,
						cwd: "src"
						ext: ".unit.js"
						src: "**/*.unit.coffee"
						dest: "build"
						expand: true
				]
		jasmine_nodejs:
			unit:
				options:
					specNameSuffix: ".unit.js"
				specs: "build/**/*.unit.js"				

	grunt.registerTask "build", ["clean:build", "coffee", "jasmine_nodejs", "clean:dist", "copy:dist", "clean:build"]
