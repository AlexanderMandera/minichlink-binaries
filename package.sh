#!/bin/bash

function create_zip () {
	cp "bin/$1" "target/minichlink"
	mv target $1
	zip -r "zip/$1.zip" $1
	mv $1 target
	rm "target/minichlink"
	sha256sum "zip/$1.zip" > "zip/$1.zip.sha"
}

function create_zip_exe () {
	cp "bin/$1.exe" "target/minichlink.exe"
	mv target $1
	zip -r "zip/$1.zip" "target"
	mv $1 target
	rm "target/minichlink.exe"
	sha256sum "zip/$1.zip" > "zip/$1.zip.sha"
}

mkdir -p target

rm -r zip/*

create_zip "minichlink_linux_amd64"
create_zip "minichlink_linux_arm32"
create_zip "minichlink_linux_arm64"
create_zip "minichlink_macos_amd64"
create_zip "minichlink_macos_arm64"
create_zip "minichlink_windows"