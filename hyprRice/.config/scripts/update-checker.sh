
updates=$(sudo pacman -Syup --print-format "%n - %v" | tail -n +5)
tooltip="No updates available"
count="0"
if [[ $updates != "" ]]; then
  count=$(echo "$updates" | wc -l)
  tooltip="Pending updates:\n${updates//$'\n'/\\n}"
fi
  echo "{\"text\":\"${count}\",\"tooltip\":\"${tooltip}\"}"
