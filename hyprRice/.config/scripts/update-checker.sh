
updates=$(sudo pacman -Syup --print-format "%n - %v")
tooltip="No updates available"
count="0"
if [[ $updates != "" ]]; then
  count=$(echo "$updates" | wc -l)
  tooltip="Pending updates:\n${updates//$'\n'/\\n}"
fi
  echo "{\"text\":\"${count}\",\"tooltip\":\"${tooltip}\"}"
