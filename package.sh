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
	cp "bin/libusb-1.0.dll" "target/libusb-1.0.dll"
	cp "bin/$1.exe" "target/minichlink.exe"
	mv target $1
	zip -r "zip/$1.zip" $1
	mv $1 target
	rm "target/libusb-1.0.dll"
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
create_zip_exe "minichlink_windows"