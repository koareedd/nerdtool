notificationCenterDB=$(ls `getconf DARWIN_USER_DIR`/com.apple.notificationcenter/db/db)
app_id=$(sqlite3 "$notificationCenterDB" 'select app_id from app_info where bundleid is "com.apple.iChat"')
unreadMessages=$(sqlite3 "$notificationCenterDB" 'select COUNT(*) from notifications where app_id is '$app_id)

echo messages: $unreadMessages\ \  \|\ \  "$(date +"%a %d %b")   $(date +"%H:%M")" | tr '[:upper:]' '[:lower:]'