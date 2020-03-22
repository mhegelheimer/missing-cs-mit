
# date will besubstituted
echo "Starting program at $(date)"

echo "Running program $0 with $# arguments with pid $$"

# $@ expands to all the arguments
for file in "$@"; do
  # When pattern is not found, grep has exit status 1
  # We redirect STDOUT and STDERR to a null register (special erasing) since we do not care about them
  grep foobar "$file" > /dev/null 2> /dev/null

  if [[ $? -ne 0 ]]; then
    echo "File $file does not have any foobar, adding one"
    echo "# foobar" >> "$file"
  fi
done
