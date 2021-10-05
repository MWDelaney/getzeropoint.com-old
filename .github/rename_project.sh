#!/usr/bin/env bash
while getopts a:n:u:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        n) name=${OPTARG};;
        u) urlname=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Project Name: $name";
echo "Project URL name: $urlname";

echo "Renaming project..."

original_author="MWDelaney"
original_name="Zero Point"
original_urlname="ZeroPoint"

# for filename in $(find . -name "*.*")
for filename in $(git ls-files -- . ':!:.github')
do
    sed -i "s/$original_author/$author/g" $filename
    sed -i "s/$original_name/$name/g" $filename
    sed -i "s/$original_urlname/$urlname/g" $filename
    echo "Renamed $filename"
done

