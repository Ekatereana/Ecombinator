DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

cat "${DIR}/logo.txt"
python3 "${DIR}/combinator.py" "$@"