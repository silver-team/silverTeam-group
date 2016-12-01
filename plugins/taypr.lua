function solid(msg, matches)
local receiver = get_receiver(msg)
local hash = 'typing:'..receiver
     if matches[1] == 'typing' and is_sudo(msg) then
--Enable Typing
     if matches[2] == 'taype on' then
    redis:del(hash)
   return 'پلاگین با موفقیت فعال شد'
--Disable Typing
     elseif matches[2] == 'taype off' then
    redis:set(hash, true)
   return 'پلاگین با موفقیت غیرفعال شد'
--Typing Status
      elseif matches[2] == 'status' then
      if not redis:get(hash) then
   return 'Typing is enable'
       else
   return 'Typing is disable'
         end
      end
   end
      if not redis:get(hash) then
send_typing(get_receiver(msg), ok_cb, false)
   end
end
return { 
patterns = {
"^[!/#](typing) (.*)$",
"(.*)",
},
run = solid
}
