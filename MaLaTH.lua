------------------------------------------------
--This Source Was Developed By (Lar) @sSs_sSs.--
--  This Is The Source Channel @sSs_sSs .   --
--          -Source Dove -                --
--       --https://t.me/sSs_sSs --        --
------------------------------------------------
URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
local Methods = io.open("./luatele.lua","r")
if Methods then
URL.tdlua_CallBack()
end
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1 }'"):read('*a')
luatele = require 'luatele'
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua MaLaTH.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua MaLaTH.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua MaLaTH.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return { 
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
 }
]])
Informationlua:close()
local TheMaLaTH = io.open("TheMaLaTH", 'w')
TheMaLaTH:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
sudo lua5.3 MaLaTH.lua
done
]])
TheMaLaTH:close()
local Run = io.open("Run", 'w')
Run:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
screen -S ]]..Redis:get(SshId.."Info:Redis:Token:User")..[[ -X kill
screen -S ]]..Redis:get(SshId.."Info:Redis:Token:User")..[[ ./TheMaLaTH
done
]])
Run:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x TheMaLaTH;chmod +x Run;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
TheMaLaTH = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheMaLaTH)
LuaTele = luatele.set_config{ api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=TheMaLaTH,token=Token }
function var(value)  
print(serpent.block(value, { comment=false }))   
end 
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
return Chat_Type
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos ={ Sudo_Id,1573309498 }  
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
end
return ControllerAll
end
function Controllerbanall(ChatId,UserId)
Status = 0
DevelopersQ = Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId) 
if UserId == 1573309498 then
Status = true
elseif UserId == 1573309498 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == TheMaLaTH then
Status = true
elseif DevelopersQ then
Status = true
else
Status = false
end
return Status
end
function Controller(ChatId,UserId)
Status = 0
Developers = Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",UserId) 
DevelopersQ = Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId) 
TheBasics = Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..ChatId,UserId)
TheBasicsQ = Redis:sismember(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..ChatId,UserId) 
Originators = Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 1573309498 then
Status = 'مبرمج السورس'
elseif UserId == 1573309498 then
Status = 'مبرمج السورس'
elseif UserId == Sudo_Id then  
Status = 'المطور الاساسي'
elseif UserId == TheMaLaTH then
Status = 'البوت'
elseif DevelopersQ then
Status = 'المطور الثانوي'
elseif Developers then
Status = Redis:get(TheMaLaTH.."MaLaTH:Developer:Bot:Reply"..ChatId) or 'المطور'
elseif TheBasicsQ then
Status = Redis:get(TheMaLaTH.."MaLaTH:PresidentQ:Group:Reply"..ChatId) or 'المالك'
elseif TheBasics then
Status = Redis:get(TheMaLaTH.."MaLaTH:President:Group:Reply"..ChatId) or 'المنشئ الاساسي'
elseif Originators then
Status = Redis:get(TheMaLaTH.."MaLaTH:Constructor:Group:Reply"..ChatId) or 'المنشئ'
elseif Managers then
Status = Redis:get(TheMaLaTH.."MaLaTH:Manager:Group:Reply"..ChatId) or 'المدير'
elseif Addictive then
Status = Redis:get(TheMaLaTH.."MaLaTH:Admin:Group:Reply"..ChatId) or 'الادمن'
elseif StatusMember == "chatMemberStatusCreator" then
Status = 'مالك المجموعة'
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = 'ادمن المجموعة'
elseif Distinguished then
Status = Redis:get(TheMaLaTH.."MaLaTH:Vip:Group:Reply"..ChatId) or 'المميز'
else
Status = Redis:get(TheMaLaTH.."MaLaTH:Mempar:Group:Reply"..ChatId) or 'العضو'
end  
return Status
end 
function Controller_Num(Num)
Status = 0
if tonumber(Num) == 1 then  
Status = 'المطور الاساسي'
elseif tonumber(Num) == 2 then  
Status = 'المطور الثانوي'
elseif tonumber(Num) == 3 then  
Status = 'المطور'
elseif tonumber(Num) == 44 then  
Status = 'المالك'
elseif tonumber(Num) == 4 then  
Status = 'المنشئ الاساسي'
elseif tonumber(Num) == 5 then  
Status = 'المنشئ'
elseif tonumber(Num) == 6 then  
Status = 'المدير'
elseif tonumber(Num) == 7 then  
Status = 'الادمن'
else
Status = 'المميز'
end  
return Status
end 
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = LuaTele.getChatMember(ChatId,user2).status
if GetMemberStatus.can_change_info then
change_info = '‹ ✓ ›' else change_info = '‹ ✗ ›'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '‹ ✓ ›' else delete_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_invite_users then
invite_users = '‹ ✓ ›' else invite_users = '‹ ✗ ›'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '‹ ✓ ›' else pin_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '‹ ✓ ›' else restrict_members = '‹ ✗ ›'
end
if GetMemberStatus.can_promote_members then
promote = '‹ ✓ ›' else promote = '‹ ✗ ›'
end
local reply_markupp = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '-تغيير معلومات المجموعة : '..(t1 or change_info), data = UserId..'/groupNum1//'..user2 }, 
 },
{ 
{ text = '-تثبيت الرسائل : '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2 }, 
 },
{ 
{ text = '-حظر المستخدمين : '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2 }, 
 },
{ 
{ text = '-دعوة المستخدمين : '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2 }, 
 },
{ 
{ text = '-حذف الرسائل : '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2 }, 
 },
{ 
{ text = '-اضافة مشرفين : '..(t6 or promote), data = UserId..'/groupNum6//'..user2 }, 
 },
 }
 }
LuaTele.editMessageText(ChatId,MsgId,"-صلاحيات الادمن حالياًً ↫ ⤈", 'md', false, false, reply_markupp)
end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = LuaTele.getChatMember(ChatId,UserId).status
if GetMemberStatus.can_change_info then
change_info = 1 else change_info = 0
end
if GetMemberStatus.can_delete_messages then
delete_messages = 1 else delete_messages = 0
end
if GetMemberStatus.can_invite_users then
invite_users = 1 else invite_users = 0
end
if GetMemberStatus.can_pin_messages then
pin_messages = 1 else pin_messages = 0
end
if GetMemberStatus.can_restrict_members then
restrict_members = 1 else restrict_members = 0
end
if GetMemberStatus.can_promote_members then
promote = 1 else promote = 0
end
return{ 
promote = promote,
restrict_members = restrict_members,
invite_users = invite_users,
pin_messages = pin_messages,
delete_messages = delete_messages,
change_info = change_info
 }
end
function GetSetieng(ChatId)
if Redis:get(TheMaLaTH.."MaLaTH:lockpin"..ChatId) then    
lock_pin = "✓"
else 
lock_pin = "✗"    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:tagservr"..ChatId) then    
lock_tagservr = "✓"
else 
lock_tagservr = "✗"
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:text"..ChatId) then    
lock_text = "✓"
else 
lock_text = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:AddMempar"..ChatId) == "kick" then
lock_add = "✓"
else 
lock_add = "✗ "    
end    
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Join"..ChatId) == "kick" then
lock_join = "✓"
else 
lock_join = "✗ "    
end    
if Redis:get(TheMaLaTH.."MaLaTH:Lock:edit"..ChatId) then    
lock_edit = "✓"
else 
lock_edit = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Chek:Welcome"..ChatId) then
welcome = "✓"
else 
welcome = "✗ "    
end
if Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..ChatId, "Spam:User") == "kick" then     
flood = "بالطرد "     
elseif Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..ChatId,"Spam:User") == "keed" then     
flood = "بالتقيد "     
elseif Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..ChatId,"Spam:User") == "mute" then     
flood = "بالكتم "           
elseif Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..ChatId,"Spam:User") == "del" then     
flood = "✓"
else     
flood = "✗ "     
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Photo"..ChatId) == "del" then
lock_photo = "✓" 
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Photo"..ChatId) == "ked" then 
lock_photo = "بالتقيد "   
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Photo"..ChatId) == "ktm" then 
lock_photo = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Photo"..ChatId) == "kick" then 
lock_photo = "بالطرد "   
else
lock_photo = "✗ "   
end    
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Contact"..ChatId) == "del" then
lock_phon = "✓" 
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Contact"..ChatId) == "ked" then 
lock_phon = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Contact"..ChatId) == "ktm" then 
lock_phon = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Contact"..ChatId) == "kick" then 
lock_phon = "بالطرد "    
else
lock_phon = "✗ "    
end    
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Link"..ChatId) == "del" then
lock_links = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Link"..ChatId) == "ked" then
lock_links = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Link"..ChatId) == "ktm" then
lock_links = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Link"..ChatId) == "kick" then
lock_links = "بالطرد "    
else
lock_links = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Cmd"..ChatId) == "del" then
lock_cmds = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Cmd"..ChatId) == "ked" then
lock_cmds = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Cmd"..ChatId) == "ktm" then
lock_cmds = "بالكتم "   
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Cmd"..ChatId) == "kick" then
lock_cmds = "بالطرد "    
else
lock_cmds = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:User:Name"..ChatId) == "del" then
lock_user = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:User:Name"..ChatId) == "ked" then
lock_user = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:User:Name"..ChatId) == "ktm" then
lock_user = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:User:Name"..ChatId) == "kick" then
lock_user = "بالطرد "    
else
lock_user = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:hashtak"..ChatId) == "del" then
lock_hash = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:hashtak"..ChatId) == "ked" then 
lock_hash = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:hashtak"..ChatId) == "ktm" then 
lock_hash = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:hashtak"..ChatId) == "kick" then 
lock_hash = "بالطرد "    
else
lock_hash = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId) == "del" then
lock_muse = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId) == "ked" then 
lock_muse = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId) == "ktm" then 
lock_muse = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId) == "kick" then 
lock_muse = "بالطرد "    
else
lock_muse = "✗ "    
end 
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Video"..ChatId) == "del" then
lock_ved = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Video"..ChatId) == "ked" then 
lock_ved = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Video"..ChatId) == "ktm" then 
lock_ved = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Video"..ChatId) == "kick" then 
lock_ved = "بالطرد "    
else
lock_ved = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Animation"..ChatId) == "del" then
lock_gif = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Animation"..ChatId) == "ked" then 
lock_gif = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Animation"..ChatId) == "ktm" then 
lock_gif = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Animation"..ChatId) == "kick" then 
lock_gif = "بالطرد "    
else
lock_gif = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Sticker"..ChatId) == "del" then
lock_ste = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Sticker"..ChatId) == "ked" then 
lock_ste = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Sticker"..ChatId) == "ktm" then 
lock_ste = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Sticker"..ChatId) == "kick" then 
lock_ste = "بالطرد "    
else
lock_ste = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:geam"..ChatId) == "del" then
lock_geam = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:geam"..ChatId) == "ked" then 
lock_geam = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:geam"..ChatId) == "ktm" then 
lock_geam = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:geam"..ChatId) == "kick" then 
lock_geam = "بالطرد "    
else
lock_geam = "✗ "    
end    
if Redis:get(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId) == "del" then
lock_vico = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId) == "ked" then 
lock_vico = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId) == "ktm" then 
lock_vico = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId) == "kick" then 
lock_vico = "بالطرد "    
else
lock_vico = "✗ "    
end    
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Keyboard"..ChatId) == "del" then
lock_inlin = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Keyboard"..ChatId) == "ked" then 
lock_inlin = "بالتقيد "
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Keyboard"..ChatId) == "ktm" then 
lock_inlin = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Keyboard"..ChatId) == "kick" then 
lock_inlin = "بالطرد "
else
lock_inlin = "✗ "
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:forward"..ChatId) == "del" then
lock_fwd = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:forward"..ChatId) == "ked" then 
lock_fwd = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:forward"..ChatId) == "ktm" then 
lock_fwd = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:forward"..ChatId) == "kick" then 
lock_fwd = "بالطرد "    
else
lock_fwd = "✗ "    
end    
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Document"..ChatId) == "del" then
lock_file = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Document"..ChatId) == "ked" then 
lock_file = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Document"..ChatId) == "ktm" then 
lock_file = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Document"..ChatId) == "kick" then 
lock_file = "بالطرد "    
else
lock_file = "✗ "    
end    
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Unsupported"..ChatId) == "del" then
lock_self = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Unsupported"..ChatId) == "ked" then 
lock_self = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Unsupported"..ChatId) == "ktm" then 
lock_self = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Unsupported"..ChatId) == "kick" then 
lock_self = "بالطرد "    
else
lock_self = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..ChatId) == "del" then
lock_bots = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..ChatId) == "ked" then
lock_bots = "بالتقيد "   
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..ChatId) == "kick" then
lock_bots = "بالطرد "    
else
lock_bots = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Markdaun"..ChatId) == "del" then
lock_mark = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Markdaun"..ChatId) == "ked" then 
lock_mark = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Markdaun"..ChatId) == "ktm" then 
lock_mark = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Markdaun"..ChatId) == "kick" then 
lock_mark = "بالطرد "    
else
lock_mark = "✗ "    
end
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Spam"..ChatId) == "del" then    
lock_spam = "✓"
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Spam"..ChatId) == "ked" then 
lock_spam = "بالتقيد "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Spam"..ChatId) == "ktm" then 
lock_spam = "بالكتم "    
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Spam"..ChatId) == "kick" then 
lock_spam = "بالطرد "    
else
lock_spam = "✗ "    
end        
return{ 
lock_pin = lock_pin,
lock_tagservr = lock_tagservr,
lock_text = lock_text,
lock_add = lock_add,
lock_join = lock_join,
lock_edit = lock_edit,
flood = flood,
lock_photo = lock_photo,
lock_phon = lock_phon,
lock_links = lock_links,
lock_cmds = lock_cmds,
lock_mark = lock_mark,
lock_user = lock_user,
lock_hash = lock_hash,
lock_muse = lock_muse,
lock_ved = lock_ved,
lock_gif = lock_gif,
lock_ste = lock_ste,
lock_geam = lock_geam,
lock_vico = lock_vico,
lock_inlin = lock_inlin,
lock_fwd = lock_fwd,
lock_file = lock_file,
lock_self = lock_self,
lock_bots = lock_bots,
lock_spam = lock_spam
 }
end
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'تفاعل محلو 😤' 
elseif tonumber(Message) < 200 then 
MsgText = 'تفاعلك ضعيف ليش'
elseif tonumber(Message) < 400 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 700 then 
MsgText = 'شكد تحجي😒' 
elseif tonumber(Message) < 1200 then 
MsgText = 'ملك التفاعل 😼' 
elseif tonumber(Message) < 2000 then 
MsgText = 'موش تفاعل غنبله' 
elseif tonumber(Message) < 3500 then 
MsgText = 'اساس لتفاعل ياب'  
elseif tonumber(Message) < 4000 then 
MsgText = 'عوف لجواهر وتفاعل بزودك' 
elseif tonumber(Message) < 4500 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(Message) < 5500 then 
MsgText = 'شهلتفاعل استمر يكيك' 
elseif tonumber(Message) < 7000 then 
MsgText = 'غنبله وربي 🌟' 
elseif tonumber(Message) < 9500 then 
MsgText = 'حلغوم مال تفاعل' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'تفاعل نار وشرار'  
end 
return MsgText 
end

function Getpermissions(ChatId)
local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = true else web = false
end
if Get_Chat.permissions.can_change_info then
info = true else info = false
end
if Get_Chat.permissions.can_invite_users then
invite = true else invite = false
end
if Get_Chat.permissions.can_pin_messages then
pin = true else pin = false
end
if Get_Chat.permissions.can_send_media_messages then
media = true else media = false
end
if Get_Chat.permissions.can_send_messages then
messges = true else messges = false
end
if Get_Chat.permissions.can_send_other_messages then
other = true else other = false
end
if Get_Chat.permissions.can_send_polls then
polls = true else polls = false
end

return{ 
web = web,
info = info,
invite = invite,
pin = pin,
media = media,
messges = messges,
other = other,
polls = polls
 }
end
function Get_permissions(ChatId,UserId,MsgId)
local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = '‹ ✓ ›' else web = '‹ ✗ ›'
end
if Get_Chat.permissions.can_change_info then
info = '‹ ✓ ›' else info = '‹ ✗ ›'
end
if Get_Chat.permissions.can_invite_users then
invite = '‹ ✓ ›' else invite = '‹ ✗ ›'
end
if Get_Chat.permissions.can_pin_messages then
pin = '‹ ✓ ›' else pin = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_media_messages then
media = '‹ ✓ ›' else media = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_messages then
messges = '‹ ✓ ›' else messges = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_other_messages then
other = '‹ ✓ ›' else other = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_polls then
polls = '‹ ✓ ›' else polls = '‹ ✗ ›'
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = ' ارسال الويب : '..web, data = UserId..'/web' }, 
 },
{ 
{ text = ' تغيير معلومات المجموعة : '..info, data = UserId.. '/info' }, 
 },
{ 
{ text = ' اضافه مستخدمين : '..invite, data = UserId.. '/invite' }, 
 },
{ 
{ text = ' تثبيت الرسائل : '..pin, data = UserId.. '/pin' }, 
 },
{ 
{ text = ' ارسال الميديا : '..media, data = UserId.. '/media' }, 
 },
{ 
{ text = ' ارسال الرسائل : '..messges, data = UserId.. '/messges' }, 
 },
{ 
{ text = ' اضافه البوتات : '..other, data = UserId.. '/other' }, 
 },
{ 
{ text = ' ارسال استفتاء : '..polls, data = UserId.. '/polls' }, 
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. '/delAmr' }
 },
 }
 }
LuaTele.editMessageText(ChatId,MsgId,"-صلاحيات المجموعة ↫ ⤈ ", 'md', false, false, reply_markup)
end
function Statusrestricted(ChatId,UserId)
return{ 
BanAll = Redis:sismember(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId) ,
BanGroup = Redis:sismember(TheMaLaTH.."MaLaTH:BanGroup:Group"..ChatId,UserId) ,
SilentGroup = Redis:sismember(TheMaLaTH.."MaLaTH:SilentGroup:Group"..ChatId,UserId)
 }
end
function Reply_Status(UserId,TextMsg)
local UserInfo = LuaTele.getUser(UserId)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
UserInfousername = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
UserInfousername = '['..UserInfo.first_name..'](tg://user?id='..UserId..')'
end
return { 
Lock     = '*-بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..'*',
unLock   = '*-بواسطة ↫ *'..UserInfousername..'\n'..TextMsg,
lockKtm  = '*-بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..' بالكتم *',
lockKid  = '*-بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..' بالتقييد *',
lockKick = '*-بواسطة ↫ *'..UserInfousername..'\n*'..TextMsg..' بالطرد *',
Reply    = '*-المستخدم ↫ *'..UserInfousername..'\n*'..TextMsg..'*'
 }
end
function StatusCanOrNotCan(ChatId,UserId)
Status = nil
DevelopersQ = Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",UserId) 
TheBasics = Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 1573309498 then
Status = true
elseif UserId == 1573309498 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == TheMaLaTH then
Status = true
elseif DevelopersQ then
Status = true
elseif Developers then
Status = true
elseif TheBasics then
Status = true
elseif Originators then
Status = true
elseif Managers then
Status = true
elseif Addictive then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = true
else
Status = false
end  
return Status
end 
function StatusSilent(ChatId,UserId)
Status = nil
DevelopersQ = Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",UserId) 
TheBasics = Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 1573309498 then
Status = true
elseif UserId == 1573309498 then
Status = true
elseif UserId == Sudo_Id then    
Status = true
elseif UserId == TheMaLaTH then
Status = true
elseif DevelopersQ then
Status = true
elseif Developers then
Status = true
elseif TheBasics then
Status = true
elseif Originators then
Status = true
elseif Managers then
Status = true
elseif Addictive then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
else
Status = false
end  
return Status
end 
function GetInfoBot(msg)
local GetMemberStatus = LuaTele.getChatMember(msg.chat_id,TheMaLaTH).status
if GetMemberStatus.can_change_info then
change_info = true else change_info = false
end
if GetMemberStatus.can_delete_messages then
delete_messages = true else delete_messages = false
end
if GetMemberStatus.can_invite_users then
invite_users = true else invite_users = false
end
if GetMemberStatus.can_pin_messages then
pin_messages = true else pin_messages = false
end
if GetMemberStatus.can_restrict_members then
restrict_members = true else restrict_members = false
end
if GetMemberStatus.can_promote_members then
promote = true else promote = false
end
return{ 
SetAdmin = promote,
BanUser = restrict_members,
Invite = invite_users,
PinMsg = pin_messages,
DelMsg = delete_messages,
Info = change_info
 }
end
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'wb')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"*a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoin(msg)
JoinChannel = true
local Channel = Redis:get(TheMaLaTH..'MaLaTH:Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender.user_id)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function File_Bot_Run(msg,data)  
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender.user_id
local msg_id = msg.id
local text = nil
if msg.sender.luatele == "messageSenderChat" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
return false
end

if msg.date and msg.date < tonumber(os.time() -15) then
print("->> Old Message End <<-")
return false
end
if data.content.text then
text = data.content.text.text
end
if tonumber(msg.sender.user_id) == tonumber(TheMaLaTH) then
print('This is reply for Bot')
return false
end
if Statusrestricted(msg.chat_id,msg.sender.user_id).BanAll == true then
return LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id }),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).BanGroup == true then
return LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id }),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).SilentGroup == true then
return LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
end
if tonumber(msg.sender.user_id) == 1573309498 then
msg.Name_Controller = 'مبرمج السورس '
msg.The_Controller = 1
elseif tonumber(msg.sender.user_id) == 1573309498 then
msg.Name_Controller = 'مبرمج السورس '
msg.The_Controller = 1
elseif The_ControllerAll(msg.sender.user_id) == true then  
msg.The_Controller = 1
msg.Name_Controller = 'المطور الاساسي '
elseif Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",msg.sender.user_id) == true then
msg.The_Controller = 2
msg.Name_Controller = 'المطور الثانوي'
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",msg.sender.user_id) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(TheMaLaTH.."MaLaTH:Developer:Bot:Reply"..msg.chat_id) or 'المطور '
elseif Redis:sismember(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 44
msg.Name_Controller = Redis:get(TheMaLaTH.."MaLaTH:PresidentQ:Group:Reply"..msg.chat_id) or 'المالك'
elseif Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(TheMaLaTH.."MaLaTH:President:Group:Reply"..msg.chat_id) or 'المنشئ الاساسي'
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(TheMaLaTH.."MaLaTH:Constructor:Group:Reply"..msg.chat_id) or 'المنشئ '
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(TheMaLaTH.."MaLaTH:Manager:Group:Reply"..msg.chat_id) or 'المدير '
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(TheMaLaTH.."MaLaTH:Admin:Group:Reply"..msg.chat_id) or 'الادمن '
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(TheMaLaTH.."MaLaTH:Vip:Group:Reply"..msg.chat_id) or 'المميز '
elseif tonumber(msg.sender.user_id) == tonumber(TheMaLaTH) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(TheMaLaTH.."MaLaTH:Mempar:Group:Reply"..msg.chat_id) or 'العضو '
end  
if msg.The_Controller == 1 then  
msg.ControllerBot = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.DevelopersQ = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Developers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 9 then
msg.TheBasicsm = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.TheBasics = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Originators = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Managers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Addictive = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Distinguished = true
end



if Redis:get(TheMaLaTH.."MaLaTH:Lock:text"..msg_chat_id) and not msg.Distinguished then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
return false
end 
if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:Welcome"..msg_chat_id) then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Welcome = Redis:get(TheMaLaTH.."MaLaTH:Welcome:Group"..msg_chat_id)
if Welcome then 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username
else
UserInfousername = 'لا يوجد '
end
Welcome = Welcome:gsub('{ name }',UserInfo.first_name) 
Welcome = Welcome:gsub('{ user }',UserInfousername) 
Welcome = Welcome:gsub('{ NameCh }',Get_Chat.title) 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md")  
else
return LuaTele.sendText(msg_chat_id,msg_id,'-اطلق دخول ['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')\n-نورت الكروب { '..Get_Chat.title..' }',"md")  
end
end
end
if not msg.Distinguished and msg.content.luatele ~= "messageChatAddMembers" and Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id,"Spam:User") then 
if tonumber(msg.sender.user_id) == tonumber(TheMaLaTH) then
return false
end
local floods = Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id,"Spam:User") or "nil"
local Num_Msg_Max = Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5
local post_count = tonumber(Redis:get(TheMaLaTH.."MaLaTH:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id) or 0)
if post_count >= tonumber(Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5) then 
local type = Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id,"Spam:User") 
if type == "kick" then 
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-قام بالتكرار في المجموعة وتم طرده").Reply,"md",true)
end
if type == "del" then 
return LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
end
if type == "keed" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 }), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-قام بالتكرار في المجموعة وتم تقييده").Reply,"md",true)  
end
if type == "mute" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-قام بالتكرار في المجموعة وتم كتمه").Reply,"md",true)  
end
end
Redis:setex(TheMaLaTH.."MaLaTH:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id, tonumber(5), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id,"Num:Spam") then
Num_Msg_Max = Redis:hget(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id,"Num:Spam") 
end
end 
if text and not msg.Distinguished then
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Spam"..msg.chat_id) == "del" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Spam"..msg.chat_id) == "ked" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Spam"..msg.chat_id) == "kick" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Redis:get(TheMaLaTH.."MaLaTH:Lock:Spam"..msg.chat_id) == "ktm" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
end
end
if msg.forward_info and not msg.Distinguished then --التوجيه
local Fwd_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:forward"..msg_chat_id)
if Fwd_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Fwd_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Fwd_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Fwd_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is forward')
return false
end 

if msg.reply_markup and msg.reply_markup.luatele == "replyMarkupInlineKeyboard" then
if not msg.Distinguished then  --الكيبورد
local Keyboard_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Keyboard"..msg_chat_id)
if Keyboard_Group == "del" then
var(LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id }))
elseif Keyboard_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Keyboard_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Keyboard_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
end
print('This is reply_markup')
end 

if msg.content.location and not msg.Distinguished then  --الموقع
if location then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
end
print('This is location')
end 

if msg.content.entities and msg..content.entities[0] and msg.content.entities[0].type.luatele == "textEntityTypeUrl" and not msg.Distinguished then  --الماركداون
local Markduan_Gtoup = Redis:get(TheMaLaTH.."MaLaTH:Lock:Markdaun"..msg_chat_id)
if Markduan_Gtoup == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Markduan_Gtoup == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Markduan_Gtoup == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Markduan_Gtoup == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is textEntityTypeUrl')
end 

if msg.content.game and not msg.Distinguished then  --الالعاب
local Games_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:geam"..msg_chat_id)
if Games_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Games_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Games_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Games_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is games')
end 
if msg.content.luatele == "messagePinMessage" then --رساله التثبيت
local Pin_Msg = Redis:get(TheMaLaTH.."MaLaTH:lockpin"..msg_chat_id)
if Pin_Msg and not msg.Managers then
if Pin_Msg:match("(%d+)") then 
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.luatele~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
end
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if UnPin.luatele ~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n-التثبيت معطل من قبل المدراء ","md",true)
end
print('This is message Pin')
end 

if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(TheMaLaTH.."MaLaTH:Lock:Join"..msg.chat_id) == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
return false
end
end

if msg.content.luatele == "messageChatAddMembers" then --اضافه اشخاص
print('This is Add Membeers ')
Redis:incr(TheMaLaTH.."MaLaTH:Num:Add:Memp"..msg_chat_id..":"..msg.sender.user_id) 
local AddMembrs = Redis:get(TheMaLaTH.."MaLaTH:Lock:AddMempar"..msg_chat_id) 
local Lock_Bots = Redis:get(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
local Info_User = LuaTele.getUser(v) 
if Info_User.type.luatele == "userTypeBot" then
if Lock_Bots == "del" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
elseif Info_User.type.luatele == "userTypeRegular" then
Redis:incr(TheMaLaTH.."MaLaTH:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) 
if AddMembrs == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end 

if msg.content.luatele == "messageContact" and not msg.Distinguished then  --الجهات
local Contact_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Contact"..msg_chat_id)
if Contact_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Contact_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Contact_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Contact_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Contact')
end 

if msg.content.luatele == "messageVideoNote" and not msg.Distinguished then  --بصمه الفيديو
local Videonote_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Unsupported"..msg_chat_id)
if Videonote_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Videonote_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Videonote_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Videonote_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is video Note')
end 

if msg.content.luatele == "messageDocument" and not msg.Distinguished then  --الملفات
local Document_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Document"..msg_chat_id)
if Document_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Document_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Document_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Document_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Document')
end 

if msg.content.luatele == "messageAudio" and not msg.Distinguished then  --الملفات الصوتيه
local Audio_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Audio"..msg_chat_id)
if Audio_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Audio_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Audio_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Audio_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Audio')
end 

if msg.content.luatele == "messageVideo" and not msg.Distinguished then  --الفيديو
local Video_Grouo = Redis:get(TheMaLaTH.."MaLaTH:Lock:Video"..msg_chat_id)
if Video_Grouo == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Video_Grouo == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Video_Grouo == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Video_Grouo == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Video')
end 

if msg.content.luatele == "messageVoiceNote" and not msg.Distinguished then  --البصمات
local Voice_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:vico"..msg_chat_id)
if Voice_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Voice_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Voice_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Voice_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Voice')
end 

if msg.content.luatele == "messageSticker" and not msg.Distinguished then  --الملصقات
local Sticker_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Sticker"..msg_chat_id)
if Sticker_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Sticker_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Sticker_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Sticker_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Sticker')
end 

if msg.via_bot_user_id ~= 0 and not msg.Distinguished then  --انلاين
local Inlen_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Inlen"..msg_chat_id)
if Inlen_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Inlen_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Inlen_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Inlen_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is viabot')
end

if msg.content.luatele == "messageAnimation" and not msg.Distinguished then  --المتحركات
local Gif_group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Animation"..msg_chat_id)
if Gif_group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Gif_group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Gif_group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Gif_group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Animation')
end 

if msg.content.luatele == "messagePhoto" and not msg.Distinguished then  --الصور
local Photo_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Photo"..msg_chat_id)
if Photo_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Photo_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Photo_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Photo_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Photo delete')
end
if msg.content.photo and Redis:get(TheMaLaTH.."MaLaTH:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id) then
local ChatPhoto = LuaTele.setChatPhoto(msg_chat_id,msg.content.photo.sizes[2].photo.remote.id)
if (ChatPhoto.luatele == "error") then
Redis:del(TheMaLaTH.."MaLaTH:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-لا استطيع تغيير صوره المجموعة لاني لست ادمن او ليست لديه الصلاحيه ","md",true)    
end
Redis:del(TheMaLaTH.."MaLaTH:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تغيير صوره المجموعة المجموعة الى ","md",true)    
end
if (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]") 
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]") then 
local link_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Link"..msg_chat_id)  
if not msg.Distinguished then
if link_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif link_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif link_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif link_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is link ')
return false
end
end
if text and text:match("@[%a%d_]+") and not msg.Distinguished then 
local UserName_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:User:Name"..msg_chat_id)
if UserName_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif UserName_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif UserName_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif UserName_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is username ')
end
if text and text:match("#[%a%d_]+") and not msg.Distinguished then 
local Hashtak_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:hashtak"..msg_chat_id)
if Hashtak_Group == "del" then
return LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif Hashtak_Group == "ked" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif Hashtak_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Hashtak_Group == "kick" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is hashtak ')
end
if text and text:match("/[%a%d_]+") and not msg.Distinguished then 
local comd_Group = Redis:get(TheMaLaTH.."MaLaTH:Lock:Cmd"..msg_chat_id)
if comd_Group == "del" then
return LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
elseif comd_Group == "ked" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
elseif comd_Group == "ktm" then
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif comd_Group == "kick" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
end
if (Redis:get(TheMaLaTH..'MaLaTH:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'صوره'
Redis:sadd(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(TheMaLaTH.."MaLaTH:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then
Filters = 'متحركه'
Redis:sadd(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:set(TheMaLaTH.."MaLaTH:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then
Filters = 'ملصق'
Redis:sadd(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(TheMaLaTH.."MaLaTH:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(TheMaLaTH.."MaLaTH:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, text)  
Redis:sadd(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id,'text:'..text)  
Filters = 'نص'
end
Redis:set(TheMaLaTH..'MaLaTH:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true1')
return LuaTele.sendText(msg_chat_id,msg_id,"\n-ارسل تحذير ( "..Filters.." ) عند ارساله","md",true)  
end
end
if text and (Redis:get(TheMaLaTH..'MaLaTH:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true1') then
local Text_Filter = Redis:get(TheMaLaTH.."MaLaTH:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(TheMaLaTH.."MaLaTH:Filter:Group:"..Text_Filter..msg_chat_id,text)  
end  
Redis:del(TheMaLaTH.."MaLaTH:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
Redis:del(TheMaLaTH..'MaLaTH:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-تم اضافه رد التحذير","md",true)  
end
if text and (Redis:get(TheMaLaTH..'MaLaTH:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'DelFilter') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'الصوره'
Redis:srem(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(TheMaLaTH.."MaLaTH:Filter:Group:"..msg.content.photo.sizes[1].photo.id..msg_chat_id)  
elseif msg.content.animation then
Filters = 'المتحركه'
Redis:srem(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:del(TheMaLaTH.."MaLaTH:Filter:Group:"..msg.content.animation.animation.id..msg_chat_id)  
elseif msg.content.sticker then
Filters = 'الملصق'
Redis:srem(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(TheMaLaTH.."MaLaTH:Filter:Group:"..msg.content.sticker.sticker.id..msg_chat_id)  
elseif text then
Redis:srem(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id,'text:'..text)  
Redis:del(TheMaLaTH.."MaLaTH:Filter:Group:"..text..msg_chat_id)  
Filters = 'النص'
end
Redis:del(TheMaLaTH..'MaLaTH:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم الغاء منع ("..Filters..")","md",true)  
end
end
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
DelFilters = msg.content.photo.sizes[1].photo.id
statusfilter = 'الصوره'
elseif msg.content.animation then
DelFilters = msg.content.animation.animation.id
statusfilter = 'المتحركه'
elseif msg.content.sticker then
DelFilters = msg.content.sticker.sticker.id
statusfilter = 'الملصق'
elseif text then
DelFilters = text
statusfilter = 'الرساله'
end
local ReplyFilters = Redis:get(TheMaLaTH.."MaLaTH:Filter:Group:"..DelFilters..msg_chat_id)
if ReplyFilters and not msg.Distinguished then
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.id })
return LuaTele.sendText(msg_chat_id,msg_id,"*-لقد تم منع ( "..statusfilter.." ) هنا*\n-"..ReplyFilters,"md",true)   
end
end
if text and Redis:get(TheMaLaTH.."MaLaTH:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id) == "true" then
local NewCmmd = Redis:get(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
Redis:del(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
Redis:del(TheMaLaTH.."MaLaTH:Command:Reids:Group:New"..msg_chat_id)
Redis:srem(TheMaLaTH.."MaLaTH:Command:List:Group"..msg_chat_id,text)
LuaTele.sendText(msg_chat_id,msg_id,"-تم ازالة هاذا ↫ ‹ "..text.." ›","md",true)
else
LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد امر بهاذا الاسم","md",true)
end
Redis:del(TheMaLaTH.."MaLaTH:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id)
return false
end
if text and Redis:get(TheMaLaTH.."MaLaTH:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id) == "true" then
Redis:set(TheMaLaTH.."MaLaTH:Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(TheMaLaTH.."MaLaTH:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id)
Redis:set(TheMaLaTH.."MaLaTH:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id,"true1") 
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الامر الجديد ليتم وضعه مكان القديم","md",true)  
end
if text and Redis:get(TheMaLaTH.."MaLaTH:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id) == "true1" then
local NewCmd = Redis:get(TheMaLaTH.."MaLaTH:Command:Reids:Group:New"..msg_chat_id)
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..text,NewCmd)
Redis:sadd(TheMaLaTH.."MaLaTH:Command:List:Group"..msg_chat_id,text)
Redis:del(TheMaLaTH.."MaLaTH:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ الامر باسم ↫ ‹ "..text..' ›',"md",true)
end
if Redis:get(TheMaLaTH.."MaLaTH:Set:Link"..msg_chat_id..""..msg.sender.user_id) then
if text == "الغاء" then
Redis:del(TheMaLaTH.."MaLaTH:Set:Link"..msg_chat_id..""..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم الغاء حفظ الرابط","md",true)         
end
if text and text:match("(https://telegram.me/%S+)") or text and text:match("(https://t.me/%S+)") then     
local LinkGroup = text:match("(https://telegram.me/%S+)") or text:match("(https://t.me/%S+)")   
Redis:set(TheMaLaTH.."MaLaTH:Group:Link"..msg_chat_id,LinkGroup)
Redis:del(TheMaLaTH.."MaLaTH:Set:Link"..msg_chat_id..""..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ الرابط بنجاح","md",true)         
end
end 
if Redis:get(TheMaLaTH.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id) then 
if text == "الغاء" then 
Redis:del(TheMaLaTH.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id)  
return LuaTele.sendText(msg_chat_id,msg_id,"-تم الغاء حفظ الترحيب","md",true)   
end 
Redis:del(TheMaLaTH.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id)  
Redis:set(TheMaLaTH.."MaLaTH:Welcome:Group"..msg_chat_id,text) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ ترحيب المجموعة","md",true)     
end
if Redis:get(TheMaLaTH.."MaLaTH:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" then 
Redis:del(TheMaLaTH.."MaLaTH:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم الغاء حفظ القوانين","md",true)   
end 
Redis:set(TheMaLaTH.."MaLaTH:Group:Rules" .. msg_chat_id,text) 
Redis:del(TheMaLaTH.."MaLaTH:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ قوانين المجموعة","md",true)  
end  
if Redis:get(TheMaLaTH.."MaLaTH:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" then 
Redis:del(TheMaLaTH.."MaLaTH:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم الغاء حفظ وصف المجموعة","md",true)   
end 
LuaTele.setChatDescription(msg_chat_id,text) 
Redis:del(TheMaLaTH.."MaLaTH:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ وصف المجموعة","md",true)  
end  
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(TheMaLaTH.."MaLaTH:Text:Manager"..msg.sender.user_id..":"..msg_chat_id.."")
if Redis:get(TheMaLaTH.."MaLaTH:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then
Redis:del(TheMaLaTH.."MaLaTH:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  
end   
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Text"..test..msg_chat_id, text)  
end  
if msg.content.audio then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  
end
if msg.content.animation then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  
end
if msg.content.video_note then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.video then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
print(idPhoto)
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  
end
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ رد للمدير بنجاح \n-ارسل ( "..test.." ) لرؤية الرد","md",true)  
end  
end
if text and text:match("^(.*)$") then
if Redis:get(TheMaLaTH.."MaLaTH:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
Redis:set(TheMaLaTH.."MaLaTH:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true1")
Redis:set(TheMaLaTH.."MaLaTH:Text:Manager"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(TheMaLaTH.."MaLaTH:List:Manager"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل لي الرد سواء كان 
‹ ملف-ملصق-متحركه-صوره
-فيديو-بصمه الفيديو-بصمه-صوت-رساله ›
-يمكنك اضافة الى النص ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد السحكات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(TheMaLaTH.."MaLaTH:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(TheMaLaTH.."MaLaTH:List:Manager"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف الرد من ردود المدير ","md",true)  
return false
end
end
if text and Redis:get(TheMaLaTH.."MaLaTH:Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Photo"..text)
local video = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Video"..text)
local document = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:File"..text)
local audio = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',UserInfo.first_name)
local Text = Text:gsub('#id',msg.sender.user_id)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,Text,"md",true)  
end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text and Redis:get(TheMaLaTH.."MaLaTH:Status:Reply"..msg_chat_id) then
local anemi = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',msg.sender.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,Texingt,"md",true)  
end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(TheMaLaTH.."MaLaTH:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id)
if Redis:get(TheMaLaTH.."MaLaTH:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then
Redis:del(TheMaLaTH.."MaLaTH:Set:Rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:stekr"..test, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:vico"..test, msg.content.voice_note.voice.remote.id)  
end   
if msg.content.animation then   
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Gif"..test, msg.content.animation.animation.remote.id)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content.audio then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Audio"..test, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:File"..test, msg.content.document.document.remote.id)  
end
if msg.content.video then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Video"..test, msg.content.video.video.remote.id)  
end
if msg.content.video_note then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Photo"..test, idPhoto)  
end
LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ رد للمطور \n-ارسل ( "..test.." ) لرؤية الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(TheMaLaTH.."MaLaTH:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
Redis:set(TheMaLaTH.."MaLaTH:Set:Rd"..msg.sender.user_id..":"..msg_chat_id, "true1")
Redis:set(TheMaLaTH.."MaLaTH:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:sadd(TheMaLaTH.."MaLaTH:List:Rd:Sudo", text)
LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل لي الرد سواء كان 
‹ ملف-ملصق-متحركه-صوره
-فيديو-بصمه الفيديو-بصمه-صوت-رساله ›
-يمكنك اضافة الى النص ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد السحكات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(TheMaLaTH.."MaLaTH:Set:On"..msg.sender.user_id..":"..msg_chat_id) == "true" then
list = { "Add:Rd:Sudo:video_note","Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif" }
for k,v in pairs(list) do
Redis:del(TheMaLaTH..'MaLaTH:'..v..text)
end
Redis:del(TheMaLaTH.."MaLaTH:Set:On"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(TheMaLaTH.."MaLaTH:List:Rd:Sudo", text)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف الرد من ردود المطور","md",true)  
end
end
if Redis:get(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر-' then   
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(TheMaLaTH.."MaLaTH:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
Redis:set(TheMaLaTH.."MaLaTH:PinMsegees:"..v,msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
Redis:set(TheMaLaTH.."MaLaTH:PinMsegees:"..v,idPhoto)
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
Redis:set(TheMaLaTH.."MaLaTH:PinMsegees:"..v,msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
Redis:set(TheMaLaTH.."MaLaTH:PinMsegees:"..v,msg.content.voice_note.voice.remote.id)
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
Redis:set(TheMaLaTH.."MaLaTH:PinMsegees:"..v,msg.content.video.video.remote.id)
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
Redis:set(TheMaLaTH.."MaLaTH:PinMsegees:"..v,msg.content.animation.animation.remote.id)
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
Redis:set(TheMaLaTH.."MaLaTH:PinMsegees:"..v,msg.content.document.document.remote.id)
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
Redis:set(TheMaLaTH.."MaLaTH:PinMsegees:"..v,msg.content.audio.audio.remote.id)
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
Redis:set(TheMaLaTH.."MaLaTH:PinMsegees:"..v,text)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"-تمت الاذاعه الى *-"..#list.." * مجموعة في البوت ","md",true)      
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheMaLaTH.."MaLaTH:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر-' then   
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء الاذاعه خاص","md",true)  
end 
local list = Redis:smembers(TheMaLaTH..'MaLaTH:Num:User:Pv')  
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"-تمت الاذاعه الى *-"..#list.." * مشترك في البوت ","md",true)      
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheMaLaTH.."MaLaTH:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر-' then   
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(TheMaLaTH.."MaLaTH:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"-تمت الاذاعه الى *-"..#list.." * مجموعة في البوت ","md",true)      
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر-' then   
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء الاذاعه بالتوجيه للمجموعات","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(TheMaLaTH.."MaLaTH:ChekBotAdd")   
LuaTele.sendText(msg_chat_id,msg_id,"-تم التوجيه الى *-"..#list.." * مجموعة في البوت ","md",true)      
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,0,true,false,false)
end   
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheMaLaTH.."MaLaTH:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر-' then   
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء الاذاعه بالتوجيه خاص","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(TheMaLaTH.."MaLaTH:Num:User:Pv")   
LuaTele.sendText(msg_chat_id,msg_id,"-تم التوجيه الى *-"..#list.." * مجموعة في البوت ","md",true) 
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,1,msg.media_album_id,false,true)
end   
Redis:del(TheMaLaTH.."MaLaTH:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end 
return false
end
if text and Redis:get(TheMaLaTH..'MaLaTH:GetTexting:DevTheMaLaTH'..msg_chat_id..':'..msg.sender.user_id) then
if text == 'الغاء' or text == 'الغاء الامر-' then 
Redis:del(TheMaLaTH..'MaLaTH:GetTexting:DevTheMaLaTH'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'-تم الغاء حفظ كليشة المطور')
end
Redis:set(TheMaLaTH..'MaLaTH:Texting:DevTheMaLaTH',text)
Redis:del(TheMaLaTH..'MaLaTH:GetTexting:DevTheMaLaTH'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'-تم حفظ كليشة المطور')
end
if Redis:get(TheMaLaTH.."MaLaTH:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' or text == 'الغاء الامر-' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء امر تعين الايدي عام","md",true)  
Redis:del(TheMaLaTH.."MaLaTH:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) 
return false  
end 
Redis:del(TheMaLaTH.."MaLaTH:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(TheMaLaTH.."MaLaTH:Set:Id:Groups"..msg.chat_id,text:match("(.*)"))
LuaTele.sendText(msg_chat_id,msg_id,'-تم تعين الايدي عام',"md",true)  
end
if Redis:get(TheMaLaTH.."MaLaTH:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' or text == 'الغاء الامر-' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء امر تعين الايدي","md",true)  
Redis:del(TheMaLaTH.."MaLaTH:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
return false  
end 
Redis:del(TheMaLaTH.."MaLaTH:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(TheMaLaTH.."MaLaTH:Set:Id:Group"..msg.chat_id,text:match("(.*)"))
LuaTele.sendText(msg_chat_id,msg_id,'-تم تعين الايدي الجديد',"md",true)  
end
if Redis:get(TheMaLaTH.."MaLaTH:Change:Name:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر-' then   
Redis:del(TheMaLaTH.."MaLaTH:Change:Name:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء امر تغير اسم البوت","md",true)  
end 
Redis:del(TheMaLaTH.."MaLaTH:Change:Name:Bot"..msg.sender.user_id) 
Redis:set(TheMaLaTH.."MaLaTH:Name:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "-تم تغير اسم البوت الى -"..text,"md",true)    
end 
if Redis:get(TheMaLaTH.."MaLaTH:Change:Start:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر-' then   
Redis:del(TheMaLaTH.."MaLaTH:Change:Start:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء امر تغير كليشه start","md",true)  
end 
Redis:del(TheMaLaTH.."MaLaTH:Change:Start:Bot"..msg.sender.user_id) 
Redis:set(TheMaLaTH.."MaLaTH:Start:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "-تم تغيير كليشه start -"..text,"md",true)    
end 
if Redis:get(TheMaLaTH.."MaLaTH:Game:Smile"..msg.chat_id) then
if text == Redis:get(TheMaLaTH.."MaLaTH:Game:Smile"..msg.chat_id) then
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheMaLaTH.."MaLaTH:Game:Smile"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لقد فزت في اللعبه \n-اللعب مره اخره وارسل -سمايل او سمايلات","md",true)  
end
end 
if Redis:get(TheMaLaTH.."MaLaTH:Game:Monotonous"..msg.chat_id) then
if text == Redis:get(TheMaLaTH.."MaLaTH:Game:Monotonous"..msg.chat_id) then
Redis:del(TheMaLaTH.."MaLaTH:Game:Monotonous"..msg.chat_id)
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لقد فزت في اللعبه \n-اللعب مره اخره وارسل -الاسرع او ترتيب","md",true)  

end
end 
if Redis:get(TheMaLaTH.."MaLaTH:Game:Riddles"..msg.chat_id) then
if text == Redis:get(TheMaLaTH.."MaLaTH:Game:Riddles"..msg.chat_id) then
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheMaLaTH.."MaLaTH:Game:Riddles"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لقد فزت في اللعبه \n-اللعب مره اخره وارسل -حزوره","md",true)  

end
end
if Redis:get(TheMaLaTH.."MaLaTH:Game:Meaningof"..msg.chat_id) then
if text == Redis:get(TheMaLaTH.."MaLaTH:Game:Meaningof"..msg.chat_id) then
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheMaLaTH.."MaLaTH:Game:Meaningof"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لقد فزت في اللعبه \n-اللعب مره اخره وارسل -معاني","md",true)  

end
end
if Redis:get(TheMaLaTH.."MaLaTH:Game:Reflection"..msg.chat_id) then
if text == Redis:get(TheMaLaTH.."MaLaTH:Game:Reflection"..msg.chat_id) then
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheMaLaTH.."MaLaTH:Game:Reflection"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لقد فزت في اللعبه \n-اللعب مره اخره وارسل -العكس","md",true)  

end
end
if Redis:get(TheMaLaTH.."MaLaTH:Game:Estimate"..msg.chat_id..msg.sender.user_id) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
return LuaTele.sendText(msg_chat_id,msg_id,"-عذراً لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 }\n","md",true)  
end 
local GETNUM = Redis:get(TheMaLaTH.."MaLaTH:Game:Estimate"..msg.chat_id..msg.sender.user_id)
if tonumber(NUM) == tonumber(GETNUM) then
Redis:del(TheMaLaTH.."MaLaTH:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(TheMaLaTH.."MaLaTH:Game:Estimate"..msg.chat_id..msg.sender.user_id)
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id,5)  
return LuaTele.sendText(msg_chat_id,msg_id,"-مبروك فزت ويانه وخمنت الرقم الصحيح\n-تم اضافة { 5 } من النقاط \n","md",true)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Redis:incrby(TheMaLaTH.."MaLaTH:SADD:NUM"..msg.chat_id..msg.sender.user_id,1)
if tonumber(Redis:get(TheMaLaTH.."MaLaTH:SADD:NUM"..msg.chat_id..msg.sender.user_id)) >= 3 then
Redis:del(TheMaLaTH.."MaLaTH:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(TheMaLaTH.."MaLaTH:Game:Estimate"..msg.chat_id..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-اوبس لقد خسرت في اللعبه \n-حظآ اوفر في المره القادمه \n-كان الرقم الذي تم تخمينه { "..GETNUM.." }","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"-اوبس تخمينك غلط \n-ارسل رقم تخمنه مره اخرى ","md",true)  
end
end
end
end
if Redis:get(TheMaLaTH.."MaLaTH:Game:Difference"..msg.chat_id) then
if text == Redis:get(TheMaLaTH.."MaLaTH:Game:Difference"..msg.chat_id) then 
Redis:del(TheMaLaTH.."MaLaTH:Game:Difference"..msg.chat_id)
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لقد فزت في اللعبه \n-اللعب مره اخره وارسل -المختلف","md",true)  
else
Redis:del(TheMaLaTH.."MaLaTH:Game:Difference"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لقد خسرت حضا اوفر في المره القادمه\n-اللعب مره اخره وارسل -المختلف","md",true)  
end
end
if Redis:get(TheMaLaTH.."MaLaTH:Game:Example"..msg.chat_id) then
if text == Redis:get(TheMaLaTH.."MaLaTH:Game:Example"..msg.chat_id) then 
Redis:del(TheMaLaTH.."MaLaTH:Game:Example"..msg.chat_id)
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لقد فزت في اللعبه \n-اللعب مره اخره وارسل -امثله","md",true)  
else
Redis:del(TheMaLaTH.."MaLaTH:Game:Example"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لقد خسرت حضا اوفر في المره القادمه\n-اللعب مره اخره وارسل -امثله","md",true)  
end
end
if text then
local NewCmmd = Redis:get(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text)
end
end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋?? ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if Name_File ~= UserBot..'.json' then
return LuaTele.sendText(msg_chat_id,msg_id,'-عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end --end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(TheMaLaTH) ~= tonumber(FilesJson.BotId) then
return LuaTele.sendText(msg_chat_id,msg_id,'-عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end --end botid
LuaTele.sendText(msg_chat_id,msg_id,'-جاري استرجاع المشتركين والكروبات ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(TheMaLaTH..'MaLaTH:Num:User:Pv',v)  
end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(TheMaLaTH.."MaLaTH:ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasics:Group"..GroupId,v)
end
end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(TheMaLaTH.."MaLaTH:Originators:Group"..GroupId,v)
end
end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(TheMaLaTH.."MaLaTH:Managers:Group"..GroupId,v)
end
end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(TheMaLaTH.."MaLaTH:Addictive:Group"..GroupId,v)
end
end
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(TheMaLaTH.."MaLaTH:Distinguished:Group"..GroupId,v)
end
end 
end
return LuaTele.sendText(msg_chat_id,msg_id,'-تم استرجاع { '..X..' } مجموعة \n-واسترجاع { '..Y..' } مشترك في البوت')
end
end
if text == 'رفع نسخه تشاكي' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(TheMaLaTH) then 
return LuaTele.sendText(msg_chat_id,msg_id,'-عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end --end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(TheMaLaTH.."MaLaTH:ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(TheMaLaTH.."MaLaTH:Originators:Group"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(TheMaLaTH.."MaLaTH:Managers:Group"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(TheMaLaTH.."MaLaTH:Addictive:Group"..idg,idmod)
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasics:Group"..idg,idASAS)
end;end
end
return LuaTele.sendText(msg_chat_id,msg_id,'-تم استرجاع المجموعات من نسخه تشاكي')
else
return LuaTele.sendText(msg_chat_id,msg_id,'-الملف لا يدعم هاذا البوت')
end
end
end
if (Redis:get(TheMaLaTH..'MaLaTH:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text == 'الغاء' or text == 'الغاء الامر-' then 
Redis:del(TheMaLaTH..'MaLaTH:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'-تم الغاء حفظ قناة الاشتراك')
end
Redis:del(TheMaLaTH..'MaLaTH:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(TheMaLaTH..'MaLaTH:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = LuaTele.getChatMember(UserId_Info.id,TheMaLaTH).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  
end
Redis:set(TheMaLaTH..'MaLaTH:Channel:Join',ChannelUser) 
return LuaTele.sendText(msg_chat_id,msg_id,"\n-تم تعيين الاشتراك الاجباري على قناة : [@"..ChannelUser..']',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n-هاذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [@"..ChannelUser..']',"md",true)  
end
end
end
if text == 'تفعيل الاشتراك الاجباري' or text == 'تفعيل الاشتراك الاجباري-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH..'MaLaTH:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري' or text == 'تعطيل الاشتراك الاجباري-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH..'MaLaTH:Channel:Join')
return LuaTele.sendText(msg_chat_id,msg_id,"\n-تم تعطيل الاشتراك الاجباري","md",true)  
end
if text == 'تغيير الاشتراك الاجباري' or text == 'تغيير الاشتراك الاجباري-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH..'MaLaTH:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n-ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'الاشتراك الاجباري' or text == 'الاشتراك الاجباري-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
local Channel = Redis:get(TheMaLaTH..'MaLaTH:Channel:Join')
if Channel then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-الاشتراك الاجباري مفعل على : [@"..Channel..']',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n-لا توجد قناة في الاشتراك ارسل تغيير الاشتراك الاجباري","md",true)  
end
end
if text == 'تحديث السورس' or text == 'تحديث السورس-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
os.execute('rm -rf MaLaTH.lua')
download('https://raw.githubusercontent.com/MaLaTH919/MaLaTH/master/MaLaTH.lua','MaLaTH.lua')
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-تم تحديث سورس لاريكا الى الاصدار الجديد* ',"md",true)  
end
if text == 'تعطيل الاذاعة' or text == 'تعطيل الاذاعه' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:SendBcBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل الاذاعه ","md",true)
end
if text == 'تفعيل الاذاعة' or text == 'تفعيل الاذاعه' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:SendBcBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل الاذاعه للمطورين ","md",true)
end
if text == 'تعطيل المغادرة' or text == 'تعطيل المغادره' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:LeftBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل المغادره ","md",true)
end
if text == 'تفعيل المغادرة' or text == 'تفعيل المغادره' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:LeftBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل المغادره للمطورين ","md",true)
end
if (Redis:get(TheMaLaTH.."MaLaTH:AddSudosNew"..msg_chat_id) == 'true') then
if text == "الغاء" or text == 'الغاء الامر' then   
Redis:del(TheMaLaTH.."MaLaTH:AddSudosNew"..msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, "\n-تم الغاء امر تغيير المطور الاساسي","md",true)    
end 
Redis:del(TheMaLaTH.."MaLaTH:AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return { 
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
 }
]])
Informationlua:close()
return LuaTele.sendText(msg_chat_id,msg_id,"\n-تم تغيير المطور الاساسي اصبح على : [@"..text:gsub('@','').."]","md",true)  
end
end
if text == 'تغيير المطور الاساسي' or text == 'تغيير المطور الاساسي-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH.."MaLaTH:AddSudosNew"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل معرف المطور الاساسي مع @","md",true)
end
if text == 'جلب النسخه الاحتياطيه-' or text == 'جلب نسخه احتياطيه' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Groups = Redis:smembers(TheMaLaTH..'MaLaTH:ChekBotAdd')  
local UsersBot = Redis:smembers(TheMaLaTH..'MaLaTH:Num:User:Pv')  
local Get_Json = '{ "BotId": '..TheMaLaTH..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{ '
for k,v in pairs(Groups) do   
local President = Redis:smembers(TheMaLaTH.."MaLaTH:TheBasics:Group"..v)
local Constructor = Redis:smembers(TheMaLaTH.."MaLaTH:Originators:Group"..v)
local Manager = Redis:smembers(TheMaLaTH.."MaLaTH:Managers:Group"..v)
local Admin = Redis:smembers(TheMaLaTH.."MaLaTH:Addictive:Group"..v)
local Vips = Redis:smembers(TheMaLaTH.."MaLaTH:Distinguished:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{ '
else
Get_Json = Get_Json..',"'..v..'":{ '
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"sSs_sSs" }'
end
Get_Json = Get_Json..' } }'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.json','-يحتوي الملف على ↫ ‹ '..#Groups..' › مجموعة وعلى ‹ '..#UsersBot..' › مشترك', 'md')
end
if text == 'جلب نسخه الردود' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
local Get_Json = '{ "BotId": '..TheMaLaTH..','  
Get_Json = Get_Json..'"GroupsBotreply":{ '
local Groups = Redis:smembers(TheMaLaTH..'MaLaTH:ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(TheMaLaTH.."MaLaTH:List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{ '
else
Get_Json = Get_Json..',"'..ide..'":{ '
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{ ','')
db = string.gsub(db,' }','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:File"..v..ide)
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"taha":"ok"'
end
Get_Json = Get_Json..' }'
end
Get_Json = Get_Json..' } }'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./ReplyGroups.json', '', 'md')
end
if text == 'رفع نسخه الردود' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local Reply_Groups = JSON.decode(Get_Info) 
for GroupId,ListGroup in pairs(Reply_Groups.GroupsBotreply) do
if ListGroup.taha == "ok" then
for k,v in pairs(ListGroup) do
Redis:sadd(TheMaLaTH.."MaLaTH:List:Manager"..GroupId,k)
if v and v:match('gif@(.*)') then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Gif"..k..GroupId,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Vico"..k..GroupId,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Stekrs"..k..GroupId,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Text"..k..GroupId,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Photo"..k..GroupId,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Video"..k..GroupId,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:File"..k..GroupId,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Audio"..k..GroupId,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(TheMaLaTH.."MaLaTH:Add:Rd:Manager:video_note"..k..GroupId,v:match('video_note@(.*)') )
end
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-تم استرجاع ردود المجموعات* ',"md",true)  
end
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH..'MaLaTH:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'*-تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,'*-عدد احصائيات البوت الكامله \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n-عدد المجموعات : '..(Redis:scard(TheMaLaTH..'MaLaTH:ChekBotAdd') or 0)..'\n-عدد المشتركين : '..(Redis:scard(TheMaLaTH..'MaLaTH:Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تفعيل' and msg.Developers then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(TheMaLaTH.."MaLaTH:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(TheMaLaTH..'MaLaTH:Num:Add:Bot') or 0)) and not msg.ControllerBot then
return LuaTele.sendText(msg_chat_id,msg_id,'-عدد الاعضاء قليل لا يمكن تفعيل المجموعة  يجب ان يكوم اكثر من :'..Redis:get(TheMaLaTH..'MaLaTH:Num:Add:Bot'),"md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-المجموعة ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* › تم تفعيلها بالتأكيد *',"md",true)  
else
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ رفع الادمنيه ›', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id },{ text = '‹ تفعيل الحمايه ›', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id },
 },
{ 
{ text = '‹ تفعيل الايدي ›', data = msg.sender.user_id..'/'.. 'mute_IdPhoto' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' },
 },
 }
 }
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ مغادرة المجموعة ›', data = '/leftgroup@'..msg_chat_id }, 
 },
{ 
{ text = Get_Chat.title, url = Info_Chats.invite_link.invite_link }, 
 },
 }
 }
LuaTele.sendText(Sudo_Id,0,'*\n-تم تفعيل مجموعة جديده \n-من قام بتفعيلها : ‹ *['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')* › \n-معلومات المجموعة :\n-عدد الاعضاء : '..Info_Chats.member_count..'\n-عدد الادمنيه : '..Info_Chats.administrator_count..'\n-عدد المطرودين : '..Info_Chats.banned_count..'\n-عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:sadd(TheMaLaTH.."MaLaTH:ChekBotAdd",msg_chat_id)
Redis:set(TheMaLaTH.."MaLaTH:Status:Id"..msg_chat_id,true) ;Redis:set(TheMaLaTH.."MaLaTH:Status:Reply"..msg_chat_id,true) ;Redis:set(TheMaLaTH.."MaLaTH:Status:ReplySudo"..msg_chat_id,true) ;Redis:set(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id,true) ;Redis:set(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-المجموعة ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* › تم تفعيلها *','md', true, false, false, false, reply_markup)
end
end 
if text == 'تفعيل' and not msg.Developers then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا انته لست ادمن او مالك المجموعة *","md",true)  
end
if not Redis:get(TheMaLaTH.."MaLaTH:BotFree") then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-الوضع الخدمي تم تعطيله من قبل مطور البوت *","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(TheMaLaTH.."MaLaTH:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(TheMaLaTH..'MaLaTH:Num:Add:Bot') or 0)) and not msg.ControllerBot then
return LuaTele.sendText(msg_chat_id,msg_id,'-عدد الاعضاء قليل لا يمكن تفعيل المجموعة  يجب ان يكوم اكثر من :'..Redis:get(TheMaLaTH..'MaLaTH:Num:Add:Bot'),"md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-المجموعة ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* › تم تفعيلها بالتأكيد *',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ مغادرة المجموعة ›', data = '/leftgroup@'..msg_chat_id }, 
 },
{ 
{ text = Get_Chat.title, url = Info_Chats.invite_link.invite_link }, 
 },
 }
 }
LuaTele.sendText(Sudo_Id,0,'*\n-تم تفعيل مجموعة جديده \n-من قام بتفعيلها : ‹ *['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')* › \n-معلومات المجموعة :\n-عدد الاعضاء : '..Info_Chats.member_count..'\n-عدد الادمنيه : '..Info_Chats.administrator_count..'\n-عدد المطرودين : '..Info_Chats.banned_count..'\n-عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ رفع الادمنيه ›', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id },{ text = '‹ تفعيل الحمايه ›', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id },
 },
{ 
{ text = '‹ تفعيل الايدي ›', data = msg.sender.user_id..'/'.. 'mute_IdPhoto' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' },
 },
 }
 }
Redis:sadd(TheMaLaTH.."MaLaTH:ChekBotAdd",msg_chat_id)
Redis:set(TheMaLaTH.."MaLaTH:Status:Id"..msg_chat_id,true) ;Redis:set(TheMaLaTH.."MaLaTH:Status:Reply"..msg_chat_id,true) ;Redis:set(TheMaLaTH.."MaLaTH:Status:ReplySudo"..msg_chat_id,true) ;Redis:set(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id,true) ;Redis:set(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-المجموعة ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* › تم تفعيلها *','md', true, false, false, false, reply_markup)
end
end

if text == 'تعطيل' and msg.Developers then
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(TheMaLaTH.."MaLaTH:ChekBotAdd",msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-المجموعة ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* › تم تعطيلها بالتأكيد *',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = Get_Chat.title, url = Info_Chats.invite_link.invite_link }, 
 },
 }
 }
LuaTele.sendText(Sudo_Id,0,'*\n-تم تعطيل مجموعة جديده \n-من قام بتعطيلها : ‹ *['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')* › \n-معلومات المجموعة :\n-عدد الاعضاء : '..Info_Chats.member_count..'\n-عدد الادمنيه : '..Info_Chats.administrator_count..'\n-عدد المطرودين : '..Info_Chats.banned_count..'\n-عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:srem(TheMaLaTH.."MaLaTH:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-المجموعة ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* › تم تعطيلها بنجاح *','md',true)
end
end
if text == 'تعطيل' and not msg.Developers then
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا انته لست ادمن او مالك المجموعة *","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(TheMaLaTH.."MaLaTH:ChekBotAdd",msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-المجموعة ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* › تم تعطيلها بالتأكيد *',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = Get_Chat.title, url = Info_Chats.invite_link.invite_link }, 
 },
 }
 }
aLuaTele.sendText(Sudo_Id,0,'*\n-تم تعطيل مجموعة جديده \n-من قام بتعطيلها : ‹ *['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')* › \n-معلومات المجموعة :\n-عدد الاعضاء : '..Info_Chats.member_count..'\n-عدد الادمنيه : '..Info_Chats.administrator_count..'\n-عدد المطرودين : '..Info_Chats.banned_count..'\n-عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:srem(TheMaLaTH.."MaLaTH:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-المجموعة ‹ *['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* › تم تعطيلها بنجاح *','md',true)
end
end
if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(TheMaLaTH.."MaLaTH:ChekBotAdd",msg_chat_id) then
Redis:incr(TheMaLaTH..'MaLaTH:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) 
if text == "ايدي" or text == "id" or text == "iD" or text == "Id" or text == "ID" and msg.reply_to_message_id == 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
if not Redis:get(TheMaLaTH.."MaLaTH:Status:Id"..msg_chat_id) then
return false
end
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
local NumAdd = Redis:get(TheMaLaTH.."MaLaTH:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0
local Texting = { 'ملاك وناسيك بكروبنه',"حلقوم واللة ","اطلق صوره","كيكك واللة","لازك بيها غيرها عاد", }
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(TheMaLaTH.."MaLaTH:Set:Id:Group"..msg_chat_id)
if Redis:get(TheMaLaTH.."MaLaTH:Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Get_Is_Id)
else
return LuaTele.sendText(msg_chat_id,msg_id,Get_Is_Id,"md",true) 
end
else
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n*-'..Description..
'\n-ايديك ↫ '..UserId..
'\n-معرفك ↫ '..UserInfousername..
'\n-‍︙رتبتك ↫ '..RinkBot..
'\n-صورك ↫ '..TotalPhoto..
'\n-رسائلك ↫ '..TotalMsg..
'\n-تعديلاتك ↫ '..TotalEdit..
'\n-تفاعلك ↫ '..TotalMsgT..
'*', "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*-ايديك ↫ '..UserId..
'\n-معرفك ↫ '..UserInfousername..
'\n-‍︙رتبتك ↫ '..RinkBot..
'\n-رسائلك ↫ '..TotalMsg..
'\n-تعديلاتك ↫ '..TotalEdit..
'\n-تفاعلك ↫ '..TotalMsgT..
'*',"md",true) 
end
end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
return LuaTele.sendText(msg_chat_id,msg_id,'['..Get_Is_Id..']',"md",true) 
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*-ايديك ↫ '..UserId..
'\n-معرفك ↫ '..UserInfousername..
'\n-‍︙رتبتك ↫ '..RinkBot..
'\n-رسائلك ↫ '..TotalMsg..
'\n-تعديلاتك ↫ '..TotalEdit..
'\n-تفاعلك ↫ '..TotalMsgT..
'*',"md",true) 
end
end
end
if text == 'ايدي' or text == 'كشف'  and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local UserId = Message_Reply.sender.user_id
local RinkBot = Controller(msg_chat_id,Message_Reply.sender.user_id)
local TotalMsg = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..msg_chat_id..':'..Message_Reply.sender.user_id) or 0
local TotalEdit = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..msg_chat_id..Message_Reply.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*-ايديه ↫ '..UserId..
'\n-معرفه ↫ '..UserInfousername..
'\n-‍︙رتبته ↫ '..RinkBot..
'\n-رسائله ↫ '..TotalMsg..
'\n-تعديلاته ↫ '..TotalEdit..
'\n-تفاعله ↫ '..TotalMsgT..
'*',"md",true) 
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
local UserId = UserId_Info.id
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*-ايديه ↫ '..UserId..
'\n-معرفه ↫ @'..UserName..
'\n-‍︙رتبته ↫ '..RinkBot..
'\n-رسائله ↫ '..TotalMsg..
'\n-تعديلاته ↫ '..TotalEdit..
'\n-تفاعله ↫ '..TotalMsgT..
'*',"md",true) 
end
if text == 'تغيير الايدي' or text == 'تغير الايدي' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
local List = { 
[[
، 𝚞𝚜𝚎𝚛 : #username .
، 𝚖𝚜𝚐 : #msgs .
، 𝚜𝚝𝚊 : #stast .
، 𝚒𝚍 : #id .
]],
[[
◜𝗨َِS𝗘ِr : #username 🕷 .  
◜𝗠ِsِG : #msgs .
◜𝗦َt : #stast .
◜𝗜ِd : #id 🕸 .
]],
[[
˖ˑ Uຮّꫀ𝚛ꪀᥲꪔ  ࣪ ᥫ᭡ #username
˖ˑ ຮّ𝚝ᥲຮّ𝚝  ࣪ ᥫ᭡  #stast
˖ˑ ᎥĐ ࣪ ᥫ᭡ #id
˖ˑ 𝙶ᥲꪔꫀຮ  ࣪ ᥫ᭡ #game
˖ˑ ꪔຮّ𝙶ຮ  ࣪ ᥫ᭡  #msgs
]],
[[
. 𝗎𝗌𝖾𝗋 › #username . 
. 𝗌𝗍α › #stast . 
. 𝗂𝖽 › #id . 
. 𝗆𝗌𝗀 › #msgs .
]],
[[
. 𝐔𝐬𝐄𝐫 : #username  .
. 𝐌𝐬𝐆  : #msgs  .
. 𝐒𝐭𝐀 : #stast 𓂅 .
. 𝐈𝐃 : #id 𓂅 .
]],
[[
 ∵ ꪊ᥉ꫀɾ  ˛ #username ٫
∵ ᥉ƚꪖ  ˛ #stast ٫
∵ Ꭵᦔ  ˛ #id 🥡٫
∵ ꪑ᥉ᧁ  ˛ #msgs 🥡٫
]],
[[
〝 𝗎𝗦ꫀ : #username .
〝 𝖲𝗍ɑ  : #stast  . 
〝 ⁪⁬⁮Μsg : #msgs 📍.
〝 َ𝖨ժ   : #id 📍.
]],
[[
∴ 𝗎!𝗌 : #username  .
∴ 𝗌!𝗍 : #stast  .
∴ 𝗂!𝖽 : #id 🩸 .
∴ 𝗆!𝗀 : #msgs 🩸.
]],
[[
˛ USER . #username ˛
˛ STAST . #stast ˛
˛ ID . #id 🥢˛
˛ MSGS . #msgs 🥢˛
]],
[[
: 𝖴ِ᥉ᥱ : #username .
: Sƚِᥲ : #stast .
: Iَժ : #id 📌.
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs 📌.
]],
[[
: 𝚄𝚂𝙴𝚁 ، #username  .
: 𝙼𝚂𝙶 ، #msgs  .
: 𝚂𝚃𝙰 ، #stast  .
: 𝙸𝙳 ، #id  .
]],
[[
◜𝗨َِS𝗘ِr #username 🕷 .  
◜𝗠ِsِG  #msgs   .
◜𝗦َ𝗧 #stast  .
◜𝗜ِd  #id 🕸 .
]],
[[
 . USERNAME . #username
 . STAST . #stast
 . ID . #id
 . MSGS . #msgs
]],
[[
˛ 𝗎!𝗌 : #username ٰ⛓️ '.
˛ 𝗆!𝗀 #msgs .
˛ 𝗌!𝗍 : #stast .
˛𝗂!𝖽 : #id ⛓️ '.
]],
[[
َ› Msgs : #msgs .🦇
َ› ID : #id .🦇
َ› Stast : #stast .🦇
َ› UserName : #username .🦇
]],
[[
: 𝖴ِᥱ᥉ : #username .
: Iَժ : #id .
: Sƚِᥲ : #stast .
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs .
]] } 
local Text_Rand = List[math.random(#List)] 
Redis:set(TheMaLaTH.."MaLaTH:Set:Id:Group"..msg.chat_id,Text_Rand)
return LuaTele.sendText(msg_chat_id,msg_id, '-تم التغيير ارسل ايدي لعرض الايدي الجديد',"md",true)  
end
if text == 'رتبتي' then
return LuaTele.sendText(msg_chat_id,msg_id,'\n-رتبتك ↫ ‹ '..msg.Name_Controller..' ›',"md",true)  
end
if text == 'ايديي' then
return LuaTele.sendText(msg_chat_id,msg_id,'\n-ايديك ↫ ‹ '..msg.sender.user_id..' ›',"md",true)  
end
if text == 'معرفي' then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n-معرفك ↫ ‹ '..UserInfousername..' ›',"md",true)  
end
if text == 'معلوماتي' or text == 'موقعي' then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'مالك المجموعة'
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'ادمن المجموعة'
else
StatusMemberChat = 'مجرد عضو'
end
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalEdit = Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
if StatusMemberChat == 'مشرف المجموعة' then 
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status
if GetMemberStatus.can_change_info then
change_info = '‹ ✓ ›' else change_info = '‹ ✗ ›'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '‹ ✓ ›' else delete_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_invite_users then
invite_users = '‹ ✓ ›' else invite_users = '‹ ✗ ›'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '‹ ✓ ›' else pin_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '‹ ✓ ›' else restrict_members = '‹ ✗ ›'
end
if GetMemberStatus.can_promote_members then
promote = '‹ ✓ ›' else promote = '‹ ✗ ›'
end
PermissionsUser = '*\n-صلاحيات المستخدم :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n-تغيير المعلومات : '..change_info..'\n-تثبيت الرسائل : '..pin_messages..'\n-اضافه مستخدمين : '..invite_users..'\n-مسح الرسائل : '..delete_messages..'\n-حظر المستخدمين : '..restrict_members..'\n-اضافه المشرفين : '..promote..'\n\n*'
end
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*-ايديك : '..UserId..
'\n-معرفك : '..UserInfousername..
'\n-‍︙رتبتك : '..RinkBot..
'\n-‍︙رتبة المجموعة: '..StatusMemberChat..
'\n-رسائلك : '..TotalMsg..
'\n-تعديلاتك : '..TotalEdit..
'\n-تفاعلك : '..TotalMsgT..
'*'..(PermissionsUser or '') ,"md",true) 
end
if text == 'كشف البوت' then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,TheMaLaTH).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return LuaTele.sendText(msg_chat_id,msg_id,'-البوت عضو في المجموعة ',"md",true) 
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,TheMaLaTH).status
if GetMemberStatus.can_change_info then
change_info = '‹ ✓ ›' else change_info = '‹ ✗ ›'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '‹ ✓ ›' else delete_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_invite_users then
invite_users = '‹ ✓ ›' else invite_users = '‹ ✗ ›'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '‹ ✓ ›' else pin_messages = '‹ ✗ ›'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '‹ ✓ ›' else restrict_members = '‹ ✗ ›'
end
if GetMemberStatus.can_promote_members then
promote = '‹ ✓ ›' else promote = '‹ ✗ ›'
end
PermissionsUser = '*\n-صلاحيات البوت في المجموعة :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n-تغيير المعلومات : '..change_info..'\n-تثبيت الرسائل : '..pin_messages..'\n-اضافه مستخدمين : '..invite_users..'\n-مسح الرسائل : '..delete_messages..'\n-حظر المستخدمين : '..restrict_members..'\n-اضافه المشرفين : '..promote..'\n\n*'
return LuaTele.sendText(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end

if text and text:match('^تنظيف (%d+)$') then
local NumMessage = text:match('^تنظيف (%d+)$')
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
if tonumber(NumMessage) > 1000 then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-العدد اكثر من 1000 لا تستطيع الحذف',"md",true)  
end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = LuaTele.deleteMessages(msg.chat_id,{ [1]= Message })
var(deleteMessages)
Message = Message -1048576
end
LuaTele.sendText(msg_chat_id, msg_id, "-تم تنظيف ‹ "..NumMessage.. ' › من الرسائل', 'md')
end

if text and text:match('^تنزيل (.*) @(%S+)$') then
local UserName = { text:match('^تنزيل (.*) @(%S+)$') }
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
if UserName[1] == "مطور ثانوي" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*-تم تنزيله مطور ثانوي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*-تم تنزيله مطور ثانوي *").Reply,"md",true)  
end
end
if UserName[1] == "مطور" then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله مطور بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله مطور ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(3)..' ›* ',"md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله مالك بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله مالك ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(44)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله منشئ اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله من المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله من المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله من الادمنيه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله من المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله من المميزين ").Reply,"md",true)  
end
end
end
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^تنزيل (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'مطور ثانوي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله مطور ثانوي").Reply,"md",true)  
end
end
if TextMsg == 'مطور' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله مطور بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله مطور ").Reply,"md",true)  
end
end
if TextMsg == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(3)..' ›* ',"md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله مالك بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله مالك ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(44)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله منشئ اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله من المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله من المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله من الادمنيه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله من المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله من المميزين ").Reply,"md",true)  
end
end
end


if text and text:match('^تنزيل (.*) (%d+)$') then
local UserId = { text:match('^تنزيل (.*) (%d+)$') }
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'مطور ثانوي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*-تم تنزيله مطور ثانوي بالتأكيد *").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*-تم تنزيله مطور ثانوي *").Reply,"md",true)  
end
end
if UserId[1] == 'مطور' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم تنزيله مطور بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم تنزيله مطور ").Reply,"md",true)  
end
end
if UserId[1] == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(3)..' ›* ',"md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله مالك بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله مالك ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(44)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله منشئ اساسي بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله من المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله من المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله من الادمنيه بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله من المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم تنزيله من المميزين ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) @(%S+)$') then
local UserName = { text:match('^رفع (.*) @(%S+)$') }
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
if UserName[1] == "مطور ثانوي" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم ترقيته مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if UserName[1] == "مطور" then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم ترقيته مطور بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم ترقيته مطور ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(3)..' ›* ',"md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم ترقيته مالك بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم ترقيته مالك ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(44)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة المنشئين الاساسيين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة المنشئين الاساسيين ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة المنشئين  ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة المدراء  ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة الادمنية بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة الادمنية  ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم رفعه في قائمة المميزين  ").Reply,"md",true)  
end
end
end
if text and text:match("^رفع (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^رفع (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'مطور ثانوي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم ترقيته مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if TextMsg == 'مطور' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم ترقيته مطور بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم ترقيته مطور ").Reply,"md",true)  
end
end
if TextMsg == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(3)..' ›* ',"md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم ترقيته مالك بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم ترقيته مالك ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(44)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة المنشئين الاساسيين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة المنشئين الاساسيين ").Reply,"md",true)  
end
end
if TextMsg == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة المنشئين  ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة المدراء  ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة الادمنية بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة الادمنية  ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم رفعه في قائمة المميزين  ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) (%d+)$') then
local UserId = { text:match('^رفع (.*) (%d+)$') }
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'مطور ثانوي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم ترقيته مطور ثانوي بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if UserId[1] == 'مطور' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم ترقيته مطور بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم ترقيته مطور ").Reply,"md",true)  
end
end
if UserId[1] == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(3)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم ترقيته مالك بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم ترقيته مالك ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(44)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة المنشئين الاساسيين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة المنشئين الاساسيين ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة المنشئين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة المنشئين  ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة المدراء بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة المدراء  ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة الادمنية بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة الادمنية  ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة المميزين بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"-تم رفعه في قائمة المميزين  ").Reply,"md",true)  
end
end
end
if text and text:match("^تغير رد المطور (.*)$") then
local Teext = text:match("^تغير رد المطور (.*)$") 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH.."MaLaTH:Developer:Bot:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تغير رد المطور الى :"..Teext)
elseif text and text:match("^تغير رد المنشئ الاساسي (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
local Teext = text:match("^تغير رد المنشئ الاساسي (.*)$") 
Redis:set(TheMaLaTH.."MaLaTH:President:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تغير رد المنشئ الاساسي الى :"..Teext)
elseif text and text:match("^تغير رد المنشئ (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
local Teext = text:match("^تغير رد المنشئ (.*)$") 
Redis:set(TheMaLaTH.."MaLaTH:Constructor:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تغير رد المنشئ الى :"..Teext)
elseif text and text:match("^تغير رد المدير (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
local Teext = text:match("^تغير رد المدير (.*)$") 
Redis:set(TheMaLaTH.."MaLaTH:Manager:Group:Reply"..msg.chat_id,Teext) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تغير رد المدير الى :"..Teext)
elseif text and text:match("^تغير رد الادمن (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
local Teext = text:match("^تغير رد الادمن (.*)$") 
Redis:set(TheMaLaTH.."MaLaTH:Admin:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تغير رد الادمن الى :"..Teext)
elseif text and text:match("^تغير رد المميز (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
local Teext = text:match("^تغير رد المميز (.*)$") 
Redis:set(TheMaLaTH.."MaLaTH:Vip:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تغير رد المميز الى :"..Teext)
elseif text and text:match("^تغير رد العضو (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
local Teext = text:match("^تغير رد العضو (.*)$") 
Redis:set(TheMaLaTH.."MaLaTH:Mempar:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تغير رد العضو الى :"..Teext)
elseif text == 'حذف رد المطور' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Developer:Bot:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حدف رد المطور")
elseif text == 'حذف رد المنشئ الاساسي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:President:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف رد المنشئ الاساسي ")
elseif text == 'حذف رد المنشئ' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Constructor:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف رد المنشئ ")
elseif text == 'حذف رد المدير' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Manager:Group:Reply"..msg.chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف رد المدير ")
elseif text == 'حذف رد الادمن' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Admin:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف رد الادمن ")
elseif text == 'حذف رد المميز' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Vip:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف رد المميز")
elseif text == 'حذف رد العضو' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Mempar:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف رد العضو")
end
if text == 'المطورين الثانويين' or text == 'المطورين الثانوين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مطورين حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه مطورين الثانويين \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المطورين الثانويين ›', data = msg.sender.user_id..'/DevelopersQ' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مطورين حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه مطورين البوت \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المطورين ›', data = msg.sender.user_id..'/Developers' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المالكين' then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(3)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"*-لا يوجد مالكين في البوت *","md",true)  
end
ListMembers = '\n*-قائمه المالكين في البوت *\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المالكين ›', data = msg.sender.user_id..'/TheBasicsQ' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المنشئين الاساسيين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد منشئين اساسيين حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه المنشئين الاساسيين \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المنشئين الاساسيين ›', data = msg.sender.user_id..'/TheBasics' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المنشئين' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد منشئين حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه المنشئين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المنشئين ›', data = msg.sender.user_id..'/Originators' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المدراء' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مدراء حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه المدراء  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المدراء ›', data = msg.sender.user_id..'/Managers' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد ادمنيه حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه الادمنيه  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح الادمنيه ›', data = msg.sender.user_id..'/Addictive' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المميزين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مميزين حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه المميزين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المميزين ›', data = msg.sender.user_id..'/DelDistinguished' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين عام' or text == 'قائمه العام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد محظورين عام حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه المحظورين عام  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المحظورين عام ›', data = msg.sender.user_id..'/BanAll' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد محظورين حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه المحظورين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المحظورين ›', data = msg.sender.user_id..'/BanGroup' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المكتومين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مكتومين حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه المكتومين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المكتومين ›', data = msg.sender.user_id..'/SilentGroupGroup' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text and text:match("^تفعيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تفعيل (.*)$")
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:set(TheMaLaTH.."MaLaTH:Status:Link"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل الرابط ","md",true)
end
if TextMsg == 'الترحيب' then
Redis:set(TheMaLaTH.."MaLaTH:Status:Welcome"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل الترحيب ","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Status:Id"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل الايدي ","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Status:IdPhoto"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل الايدي بالصوره ","md",true)
end
if TextMsg == 'ردود المدير' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Status:Reply"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل ردود المدير ","md",true)
end
if TextMsg == 'ردود المطور' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Status:ReplySudo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل ردود المطور ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:set(TheMaLaTH.."MaLaTH:Status:Games"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل الالعاب ","md",true)
end
if TextMsg == 'اطردني' then
Redis:set(TheMaLaTH.."MaLaTH:Status:KickMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل اطردني ","md",true)
end
if TextMsg == 'صورتي' then
Redis:set(TheMaLaTH.."MaLaTH:Status:photo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل صورتي ","md",true)
end
if TextMsg == 'قول' then
Redis:set(TheMaLaTH.."MaLaTH:Status:kool"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل امر قول ","md",true)
end
if TextMsg == 'جمالي' then
Redis:set(TheMaLaTH.."MaLaTH:Status:gamle"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل جمالي ","md",true)
end
if TextMsg == 'ردود السورس' then
Redis:set(TheMaLaTH.."MaLaTH:Sasa:Jeka"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم تفعيل ردود السورس *","md",true)
end
if TextMsg == 'نزلني' then
Redis:set(TheMaLaTH.."MaLaTH:Status:remMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم تفعيل نزلني *","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل البوت الخدمي ","md",true)
end
if TextMsg == 'التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل التواصل داخل البوت ","md",true)
end

end

if text and text:match("^(.*)$") then
if Redis:get(TheMaLaTH.."MaLaTH1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:set(TheMaLaTH.."MaLaTH1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(TheMaLaTH.."MaLaTH1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(TheMaLaTH.."MaLaTH1:List:Rd:Sudo"..msg.chat_id, text)
return  LuaTele.sendText(msg_chat_id,msg_id, '\nارسل لي الكلمه الان ') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(TheMaLaTH.."MaLaTH1:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:del(TheMaLaTH..'MaLaTH1:Add:Rd:Sudo:Text'..text..msg.chat_id)
Redis:del(TheMaLaTH..'MaLaTH1:Add:Rd:Sudo:Text1'..text..msg.chat_id)
Redis:del(TheMaLaTH..'MaLaTH1:Add:Rd:Sudo:Text2'..text..msg.chat_id)
Redis:del(TheMaLaTH.."MaLaTH1:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(TheMaLaTH.."MaLaTH1:List:Rd:Sudo"..msg.chat_id, text)
return  LuaTele.sendText(msg_chat_id,msg_id,"تم حذف الرد من ردود المتعدده")
end
end
if text == "اضف رد متعدد" then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH.."MaLaTH1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الرد الذي اريد اضافته")
end
if text == "حذف رد متعدد" then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH.."MaLaTH1:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الان الكلمه لحذفها ")
end
if text then  
local test = Redis:get(TheMaLaTH.."MaLaTH1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheMaLaTH.."MaLaTH1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(TheMaLaTH.."MaLaTH1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheMaLaTH.."MaLaTH1:Add:Rd:Sudo:Text"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = Redis:get(TheMaLaTH.."MaLaTH1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheMaLaTH.."MaLaTH1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(TheMaLaTH.."MaLaTH1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheMaLaTH.."MaLaTH1:Add:Rd:Sudo:Text1"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = Redis:get(TheMaLaTH.."MaLaTH1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheMaLaTH.."MaLaTH1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(TheMaLaTH.."MaLaTH1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheMaLaTH.."MaLaTH1:Add:Rd:Sudo:Text2"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ الرد")
return false  
end  
end
if text then
local Text = Redis:get(TheMaLaTH.."MaLaTH1:Add:Rd:Sudo:Text"..text..msg.chat_id)   
local Text1 = Redis:get(TheMaLaTH.."MaLaTH1:Add:Rd:Sudo:Text1"..text..msg.chat_id)   
local Text2 = Redis:get(TheMaLaTH.."MaLaTH1:Add:Rd:Sudo:Text2"..text..msg.chat_id)   
if Text or Text1 or Text2 then 
local texting = { 
Text,
Text1,
Text2
 }
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes])
end
end
if text and text:match("^(.*)$") then
if Redis:get(TheMaLaTH.."MaLaTH11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
 LuaTele.sendText(msg_chat_id,msg_id, '\n-ارسل لي الكلمه الان ')
Redis:set(TheMaLaTH.."MaLaTH11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(TheMaLaTH.."MaLaTH11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(TheMaLaTH.."MaLaTH11:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if Redis:get(TheMaLaTH.."MaLaTH11:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
 LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف الرد من ردود المتعدده")
Redis:del(TheMaLaTH..'MaLaTH11:Add:Rd:Sudo:Text'..text)
Redis:del(TheMaLaTH..'MaLaTH11:Add:Rd:Sudo:Text1'..text)
Redis:del(TheMaLaTH..'MaLaTH11:Add:Rd:Sudo:Text2'..text)
Redis:del(TheMaLaTH.."MaLaTH11:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(TheMaLaTH.."MaLaTH11:List:Rd:Sudo", text)
return false
end
end
if text == "اضف رد متعدد عام" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH.."MaLaTH11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الرد الذي اريد اضافته")
end
if text == "حذف رد متعدد عام" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH.."MaLaTH11:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الان الكلمه لحذفها ")
end
if text then  
local test = Redis:get(TheMaLaTH.."MaLaTH11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheMaLaTH.."MaLaTH11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(TheMaLaTH.."MaLaTH11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheMaLaTH.."MaLaTH11:Add:Rd:Sudo:Text"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = Redis:get(TheMaLaTH.."MaLaTH11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheMaLaTH.."MaLaTH11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(TheMaLaTH.."MaLaTH11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheMaLaTH.."MaLaTH11:Add:Rd:Sudo:Text1"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = Redis:get(TheMaLaTH.."MaLaTH11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheMaLaTH.."MaLaTH11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(TheMaLaTH.."MaLaTH11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheMaLaTH.."MaLaTH11:Add:Rd:Sudo:Text2"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"-تم حفظ الرد")
return false  
end  
end
if text then
local Text = Redis:get(TheMaLaTH.."MaLaTH11:Add:Rd:Sudo:Text"..text)   
local Text1 = Redis:get(TheMaLaTH.."MaLaTH11:Add:Rd:Sudo:Text1"..text)   
local Text2 = Redis:get(TheMaLaTH.."MaLaTH11:Add:Rd:Sudo:Text2"..text)   
if Text or Text1 or Text2 then 
local texting = { 
Text,
Text1,
Text2
 }
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes])
end
end
 
if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then      
Redis:sadd(TheMaLaTH.."MaLaTH:allM"..msg.chat_id, msg.id)
if Redis:get(TheMaLaTH.."MaLaTH:Status:Del:Media"..msg.chat_id) then    
local gmedia = Redis:scard(TheMaLaTH.."MaLaTH:allM"..msg.chat_id)  
if gmedia >= 200 then
local liste = Redis:smembers(TheMaLaTH.."MaLaTH:allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "-تم مسح "..k.." من الوسائط تلقائيا\n-يمكنك تعطيل الميزه بستخدام الامر ( تعطيل المسح التلقائي )"
LuaTele.deleteMessages(msg.chat_id,{ [1]= Mesge })
end
end
LuaTele.sendText(msg_chat_id,msg_id, t)
Redis:del(TheMaLaTH.."MaLaTH:allM"..msg.chat_id)
end
end
end

if text == ("امسح") then  
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "-تم حذف ‹ "..k.." › من الميديا"
LuaTele.deleteMessages(msg.chat_id,{ [1]= Message })
Redis:del(TheMaLaTH.."MaLaTH:allM"..msg.chat_id)
end
end
if #list == 0 then
t = "-لا توجد ميديا في المجموعة"
end
 LuaTele.sendText(msg_chat_id,msg_id, t)
end
if text == "عدد الميديا" or text == "الميديا" or text == "ميديا" then  
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
local gmria = Redis:scard(TheMaLaTH.."MaLaTH:allM"..msg.chat_id)  
 LuaTele.sendText(msg_chat_id,msg_id,"*-عدد الميديا ↫ *‹* "..gmria.." *›","md")
end
if text == "تعطيل المسح التلقائي" or text == "تعطيل التلقائي" then        
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Status:Del:Media"..msg.chat_id)
 LuaTele.sendText(msg_chat_id,msg_id,'-تم تعطيل المسح التلقائي للميديا')
return false
end 
if text == "تفعيل المسح التلقائي" or text == "تفعيل التلقائي" then        
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH.."MaLaTH:Status:Del:Media"..msg.chat_id,true)
LuaTele.sendText(msg_chat_id,msg_id,'-تم تفعيل المسح التلقائي للميديا')
return false
end 
if text == "تعطيل اليوتيوب" then        
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Status:yt"..msg.chat_id)
 LuaTele.sendText(msg_chat_id,msg_id,'-تم تعطيل المسح اليوتيوب')
return false
end 
if text == "تفعيل اليوتيوب" then        
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
Redis:set(TheMaLaTH.."MaLaTH:Status:yt"..msg.chat_id,true)
LuaTele.sendText(msg_chat_id,msg_id,'-تم تفعيل اليوتيوب')
return false
end 
if text and text:match('^بحث (.*)$') and Redis:get(TheMaLaTH.."MaLaTH:Status:yt"..msg.chat_id) then
local Ttext = text:match('^بحث (.*)$') 
local MsgId = msg.id/2097152/0.5
local MSGID = string.gsub(MsgId,'.0','')
local httpsCurl = "https://devstorm.ml/YoutubeApi/tahaj200.php?token="..Token.."&msg="..MSGID.."&Text="..URL.escape(Ttext).."&chat_id="..msg_chat_id.."&user="..msg.sender.user_id
io.popen('curl -s "'..httpsCurl..'"')
end


if text and text:match("^تعطيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تعطيل (.*)$")
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:del(TheMaLaTH.."MaLaTH:Status:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل الرابط ","md",true)
end
if TextMsg == 'الترحيب' then
Redis:del(TheMaLaTH.."MaLaTH:Status:Welcome"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل الترحيب ","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Status:Id"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل الايدي ","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Status:IdPhoto"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل الايدي بالصوره ","md",true)
end
if TextMsg == 'ردود المدير' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Status:Reply"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل ردود المدير ","md",true)
end
if TextMsg == 'ردود المطور' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Status:ReplySudo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل ردود المطور ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Status:SetId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:del(TheMaLaTH.."MaLaTH:Status:Games"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل الالعاب ","md",true)
end
if TextMsg == 'اطردني' then
Redis:del(TheMaLaTH.."MaLaTH:Status:KickMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل اطردني ","md",true)
end
if TextMsg == 'صورتي' then
Redis:del(TheMaLaTH.."MaLaTH:Status:photo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل صورتي ","md",true)
end
if TextMsg == 'قول' then
Redis:del(TheMaLaTH.."MaLaTH:Status:kool"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل امر قول ","md",true)
end
if TextMsg == 'جمالي' then
Redis:del(TheMaLaTH.."MaLaTH:Status:gamle"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل جمالي ","md",true)
end
if TextMsg == 'ردود السورس' then
Redis:del(TheMaLaTH.."MaLaTH:Sasa:Jeka"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم تعطيل ردود السورس *","md",true)
end
if TextMsg == 'نزلني' then
Redis:del(TheMaLaTH.."MaLaTH:Status:remMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم تعطيل نزلني *","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل البوت الخدمي ","md",true)
end
if TextMsg == 'التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل التواصل داخل البوت ","md",true)
end

end

if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId_Info.id).." › *","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام @(%S+)$') then
local UserName = text:match('^الغاء العام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم الغاء حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{ 1,1,1,1,1,1,1,1,1 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/MaLaTHTeam' }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الثانوي' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'مطور السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,UserId_Info.id).." ›*","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:ktmAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم العام @(%S+)$') then
local UserName = text:match('^الغاء كتم العام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/MaLaTHTeam' }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:ktmAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم الغاء كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر @(%S+)$') then
local UserName = text:match('^حظر @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId_Info.id).." › *","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم حظره من المجموعة ").Reply,"md",true)  
end
end
if text and text:match('^الغاء حظر @(%S+)$') then
local UserName = text:match('^الغاء حظر @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم الغاء حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{ 1,1,1,1,1,1,1,1,1 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم الغاء حظره من المجموعة  ").Reply,"md",true)  
end
end

if text and text:match('^كتم @(%S+)$') then
local UserName = text:match('^كتم @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusSilent(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId_Info.id).." › *","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم كتمه في المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم كتمه في المجموعة  ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم @(%S+)$') then
local UserName = text:match('^الغاء كتم @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم الغاء كتمه من المجموعة ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم الغاء كتمه من المجموعة ").Reply,"md",true)  
end
end
if text and text:match('^تقييد (%d+) (.*) @(%S+)$') then
local UserName = { text:match('^تقييد (%d+) (.*) @(%S+)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName[3])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName[3] and UserName[3]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId_Info.id).." › *","md",true)  
end
if UserName[2] == 'يوم' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserName[2] == 'ساعه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserName[2] == 'دقيقه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{ 1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time) })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تقييده في المجموعة \n-لمدة : "..UserName[1]..' '..UserName[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*)$') and msg.reply_to_message_id ~= 0 then
local TimeKed = { text:match('^تقييد (%d+) (.*)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  
end
if TimeKed[2] == 'يوم' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TimeKed[2] == 'ساعه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TimeKed[2] == 'دقيقه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time) })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تقييده في المجموعة \n-لمدة : "..TimeKed[1]..' '..TimeKed[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*) (%d+)$') then
local UserId = { text:match('^تقييد (%d+) (.*) (%d+)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId[3])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId[3]) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId[3]).." › *","md",true)  
end
if UserId[2] == 'يوم' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserId[2] == 'ساعه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserId[2] == 'دقيقه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId[3],'restricted',{ 1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time) })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[3],"\n-تم تقييده في المجموعة \n-لمدة : "..UserId[1]..' ' ..UserId[2]).Reply,"md",true)  
end
if text and text:match('^تقييد @(%S+)$') then
local UserName = text:match('^تقييد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId_Info.id).." › *","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تقييده في المجموعة ").Reply,"md",true)  
end

if text and text:match('^الغاء التقييد @(%S+)$') then
local UserName = text:match('^الغاء التقييد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{ 1,1,1,1,1,1,1,1 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم الغاء تقييده من المجموعة").Reply,"md",true)  
end

if text and text:match('^طرد @(%S+)$') then
local UserName = text:match('^طرد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId_Info.id).." › *","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم طرده من المجموعة ").Reply,"md",true)  
end
if text == ('حظر عام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,Message_Reply.sender.user_id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:BanAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text == ('الغاء العام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:BanAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم الغاء حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{ 1,1,1,1,1,1,1,1,1 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/MaLaTHTeam' }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = LuaTele.getUser(Message_Reply.sender.user_id)
if ban.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if ban and ban.type and ban.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'المطور الاساسي' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'المطور الثانوي' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مطور السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذرا لا تستطيع كتم عام‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." ›*","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:ktmAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:ktmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text == ('الغاء كتم العام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/MaLaTHTeam' }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = LuaTele.getUser(Message_Reply.sender.user_id)
if ban.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if ban and ban.type and ban.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:ktmAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم الغاء كتمه عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:ktmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم حظره من المجموعة ").Reply,"md",true)  
end
end
if text == ('الغاء حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم الغاء حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{ 1,1,1,1,1,1,1,1,1 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم الغاء حظره من المجموعة  ").Reply,"md",true)  
end
end

if text == ('كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusSilent(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم كتمه في المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم كتمه في المجموعة  ").Reply,"md",true)  
end
end
if text == ('الغاء كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم الغاء كتمه من المجموعة ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم الغاء كتمه من المجموعة ").Reply,"md",true)  
end
end

if text == "نزلني" then
if not Redis:get(TheMaLaTH.."MaLaTH:Status:remMe"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"*-امر نزلني تم تعطيله من قبل المدراء *","md",true)  
end
if The_ControllerAll(msg.sender.user_id) == true then
Rink = 1
elseif Redis:sismember(TheMaLaTH.."MaLaTH:DevelopersQ:Groups",msg.sender.user_id)  then
Rink = 2
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",msg.sender.user_id)  then
Rink = 3
elseif Redis:sismember(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 4
elseif Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 5
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 6
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 7
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 8
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, msg.sender.user_id) then
Rink = 9
else
Rink = 10
end
if Rink == 10 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-ليس لديك رتب عزيزي *","md",true)  
end
if Rink <= 7  then
return LuaTele.sendText(msg_chat_id,msg_id,"-استطيع تنزيل الادمنيه والمميزين فقط","md",true) 
else
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, msg.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تنزيلك من الادمنيه والمميزين ","md",true) 
end
end


if text == ('تقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{ 1,0,0,0,0,0,0,0,0 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تقييده في المجموعة ").Reply,"md",true)  
end

if text == ('الغاء التقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{ 1,1,1,1,1,1,1,1 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم الغاء تقييده من المجموعة").Reply,"md",true)  
end

if text == ('طرد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,Message_Reply.sender.user_id).." › *","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم طرده من المجموعة ").Reply,"md",true)  
end

if text and text:match('^حظر عام (%d+)$') then
local UserId = text:match('^حظر عام (%d+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId).." › *","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام (%d+)$') then
local UserId = text:match('^الغاء العام (%d+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم الغاء حظره عام من المجموعات بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{ 1,1,1,1,1,1,1,1,1 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر (%d+)$') then
local UserId = text:match('^حظر (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId).." › *","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم حظره من المجموعة ").Reply,"md",true)  
end
end
if text and text:match('^الغاء حظر (%d+)$') then
local UserId = text:match('^الغاء حظر (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم الغاء حظره من المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{ 1,1,1,1,1,1,1,1,1 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم الغاء حظره من المجموعة  ").Reply,"md",true)  
end
end

if text and text:match('^كتم (%d+)$') then
local UserId = text:match('^كتم (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusSilent(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId).." › *","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم كتمه في المجموعة بالتأكيد ").Reply,"md",true)  
else
Redis:sadd(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم كتمه في المجموعة  ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم (%d+)$') then
local UserId = text:match('^الغاء كتم (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم الغاء كتمه من المجموعة ").Reply,"md",true)  
else
Redis:srem(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم الغاء كتمه من المجموعة ").Reply,"md",true)  
end
end

if text and text:match('^تقييد (%d+)$') then
local UserId = text:match('^تقييد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId).." › *","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{ 1,0,0,0,0,0,0,0,0 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم تقييده في المجموعة ").Reply,"md",true)  
end

if text and text:match('^الغاء التقييد (%d+)$') then
local UserId = text:match('^الغاء التقييد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{ 1,1,1,1,1,1,1,1 })
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم الغاء تقييده من المجموعة").Reply,"md",true)  
end

if text and text:match('^طرد (%d+)$') then
local UserId = text:match('^طرد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,UserId).." › *","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"-تم طرده من المجموعة ").Reply,"md",true)  
end

if text == "اطردني" or text == "طردني" then
if not Redis:get(TheMaLaTH.."MaLaTH:Status:KickMe"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"*-امر اطردني تم تعطيله من قبل المدراء *","md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if StatusCanOrNotCan(msg_chat_id,msg.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً لا تستطيع استخدام الامر على ‹ "..Controller(msg_chat_id,msg.sender.user_id).." › *","md",true)  
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
KickMe = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
KickMe = true
else
KickMe = false
end
if KickMe == true then
return LuaTele.sendText(msg_chat_id,msg_id,"*-عذرا لا استطيع طرد ادمنيه ومنشئين المجموعة*","md",true)    
end
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم طردك من المجموعة بنائآ على طلبك").Reply,"md",true)  
end

if text == 'ادمنيه الكروب' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
listAdmin = '\n*-قائمه الادمنيه \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Creator = '↬ *‹ المالك ›*'
else
Creator = ""
end
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listAdmin = listAdmin.."*"..k.." -@"..UserInfo.username.."* "..Creator.."\n"
else
listAdmin = listAdmin.."*"..k.." -*["..UserInfo.id.."](tg://user?id="..UserInfo.id..") "..Creator.."\n"
end
end
LuaTele.sendText(msg_chat_id,msg_id,listAdmin,"md",true)  
end
if text == 'رفع الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
LuaTele.sendText(msg_chat_id,msg_id,'\n*-تم ترقيه -('..y..') ادمنيه *',"md",true)  
end

if text == 'المالك' or text == 'المنشئ' then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌔︰︰عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(itsEssen..'Essen:Channel:Join:Name')..'', url = 't.me/'..Redis:get(itsEssen..'Essen:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.first_name == "" then
LuaTele.sendText(msg_chat_id,msg_id,"*⌔︰︰اوبس , المالك حسابه محذوف *","md",true)  
return false
end 
local photo = LuaTele.getUserProfilePhotos(UserInfo.id)
local InfoUser = LuaTele.getUserFullInfo(UserInfo.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
if photo.total_count > 0 then
local TestText = "  ❲ Owner Groups ❳\n━═━═━═━═━\n⌔︰*Owner Name* :  ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n⌔︰*Owner Bio* : [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '٬ 𝙊𝙗𝙖 𝙇𝙖𝙍𝙞𝙘𝙖 🕷 ٫', url = "https://t.me/MaLaTHTEAM"}
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else

local TestText = "-معلومات المالك : \n\n-["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n \n ["..Bio.."]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
end
end


if text == 'كشف البوتات' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
listBots = '\n*-قائمة البوتات ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if Info_Members.members[k].status.luatele == "chatMemberStatusAdministrator" then
x = x + 1
Admin = '↬ *‹ ادمن ›*'
else
Admin = ""
end
listBots = listBots.."*"..k.." -@"..UserInfo.username.."* "..Admin.."\n"
end
LuaTele.sendText(msg_chat_id,msg_id,listBots.."*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n-عدد البوتات التي هي ادمن ( "..x.." )*","md",true)  
end


 
if text == 'المقيدين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = nil
restricted = '\n*-قائمة المقيديين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted.."*"..x.." -@"..UserInfo.username.."*\n"
else
restricted = restricted.."*"..x.." -*["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n"
end
end
end
if y == true then
LuaTele.sendText(msg_chat_id,msg_id,restricted,"md",true)  
end
end


if text == "غادر" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,"*\n-تم مغادرة المجموعة بأمر من المطور *","md",true)  
local Left_Bot = LuaTele.leaveChat(msg.chat_id)
end
if text == 'تاك للكل' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
listall = '\n*-قائمة الاعضاء ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall.."*"..k.." -@"..UserInfo.username.."*\n"
else
listall = listall.."*"..k.." -* ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n"
end
end
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  
end

if text == "قفل الدردشه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:text"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الدردشه").Lock,"md",true)  
return false
end 
if text == "قفل الاضافه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheMaLaTH.."MaLaTH:Lock:AddMempar"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل اضافة الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل الدخول" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheMaLaTH.."MaLaTH:Lock:Join"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل دخول الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل البوتات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل البوتات").Lock,"md",true)  
return false
end 
if text == "قفل البوتات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل البوتات").lockKick,"md",true)  
return false
end 
if text == "قفل الاشعارات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end  
Redis:set(TheMaLaTH.."MaLaTH:Lock:tagservr"..msg_chat_id,true)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الاشعارات").Lock,"md",true)  
return false
end 
if text == "قفل التثبيت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end  
Redis:set(TheMaLaTH.."MaLaTH:lockpin"..msg_chat_id,(LuaTele.getChatPinnedMessage(msg_chat_id).id or true)) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التثبيت هنا").Lock,"md",true)  
return false
end 
if text == "قفل التعديل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheMaLaTH.."MaLaTH:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل تعديل الميديا" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheMaLaTH.."MaLaTH:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل الكل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end  
Redis:set(TheMaLaTH.."MaLaTH:Lock:tagservrbot"..msg_chat_id,true)   
list ={ "Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam" }
for i,lock in pairs(list) do 
Redis:set(TheMaLaTH..'MaLaTH:'..lock..msg_chat_id,"del")    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل جميع الاوامر").Lock,"md",true)  
return false
end 


--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheMaLaTH.."MaLaTH:Lock:AddMempar"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح اضافة الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح الدردشه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheMaLaTH.."MaLaTH:Lock:text"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الدردشه").unLock,"md",true)  
return false
end 
if text == "فتح الدخول" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheMaLaTH.."MaLaTH:Lock:Join"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح دخول الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح البوتات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح البوتات " then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح الاشعارات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end  
Redis:del(TheMaLaTH.."MaLaTH:Lock:tagservr"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الاشعارات").unLock,"md",true)  
return false
end 
if text == "فتح التثبيت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheMaLaTH.."MaLaTH:lockpin"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح التثبيت هنا").unLock,"md",true)  
return false
end 
if text == "فتح التعديل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheMaLaTH.."MaLaTH:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح تعديل الميديا" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheMaLaTH.."MaLaTH:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح الكل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheMaLaTH.."MaLaTH:Lock:tagservrbot"..msg_chat_id)   
list ={ "Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam" }
for i,lock in pairs(list) do 
Redis:del(TheMaLaTH..'MaLaTH:'..lock..msg_chat_id)    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"*-تم فتح جميع الاوامر*").unLock,"md",true)  
return false
end 
if text == "@all" or text == "تاك عام" or text == "all" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
x = 0
tags = 0
local list = Info_Members.members
for k, v in pairs(list) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if x == 5 or x == tags or k == 0 then
tags = x + 5
listall = ""
end
x = x + 1
if UserInfo.first_name ~= '' then
listall = listall.." ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id.."),"
end
if x == 5 or x == tags or k == 0 then
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  
end
end
end
if text == "غنيلي" then
Abs = math.random(4,2824); 
local Text ='*-تم اختيار المقطع الصوتي لك*'
keyboard = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/AudiosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "متحركه" then
Abs = math.random(2,1075); 
local Text ='*-تم اختيار المتحركه لك*'
keyboard = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/GifDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "شعر" then
Abs = math.random(2,140); 
local Text ='*-تم اختيار الشعر لك*'
keyboard = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ميمز" then
Abs = math.random(2,1201); 
local Text ='*-تم اختيار الميمز لك*'
keyboard = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/MemzDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ريمكس" or text == "ريماكس" then 
Abs = math.random(2,612); 
local Text ='*-تم اختيار ريمكس لك*'
keyboardd = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/RemixDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "فلم" or text == "فيلم" then 
Abs = math.random(45,125); 
local Text ='*-تم اختيار الفلم لك*'
keyboardd = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/MoviesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "انمي" or text == "انميي" then 
Abs = math.random(3,1002); 
local Text ='*-تم اختيار الانمي لك*'
keyboardd = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/AnimeDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "اغنيه" or text == "اغنية" then
Abs = math.random(2,1167); 
local Text ='*-تم اختيار الاغنيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/DavidMp3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "صوره" or text == "صورة" then
Abs = math.random(4,1171); 
local Text ='*-تم اختيار الصوره لك*'
keyboardd = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/PhotosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "مسلسل" then
Abs = math.random(2,54); 
local Text ='*-تم اختيار المسلسل لك*'
keyboardd = {} 
keyboard.inline_keyboard = {{{text='‹ TeAm LaRiCa ›',url="t.me/MaLaTHTeam"}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/SeriesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--------------------------------------------------------------------------------------------------------------
if text == "قفل التكرار" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:hset(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:hset(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:hset(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:hset(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:hdel(TheMaLaTH.."MaLaTH:Spam:Group:User"..msg_chat_id ,"Spam:User")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح التكرار").unLock,"md",true)  
end
if text == "قفل الروابط" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Link"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الروابط").Lock,"md",true)  
return false
end 
if text == "قفل الروابط بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Link"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الروابط").lockKid,"md",true)  
return false
end 
if text == "قفل الروابط بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Link"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الروابط").lockKtm,"md",true)  
return false
end 
if text == "قفل الروابط بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Link"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الروابط").lockKick,"md",true)  
return false
end 
if text == "فتح الروابط" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Link"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الروابط").unLock,"md",true)  
return false
end 
if text == "قفل المعرفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:User:Name"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل المعرفات").Lock,"md",true)  
return false
end 
if text == "قفل المعرفات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:User:Name"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل المعرفات").lockKid,"md",true)  
return false
end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:User:Name"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل المعرفات").lockKtm,"md",true)  
return false
end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:User:Name"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل المعرفات").lockKick,"md",true)  
return false
end 
if text == "فتح المعرفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:User:Name"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح المعرفات").unLock,"md",true)  
return false
end 
if text == "قفل التاك" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:hashtak"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التاك").Lock,"md",true)  
return false
end 
if text == "قفل التاك بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:hashtak"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التاك").lockKid,"md",true)  
return false
end 
if text == "قفل التاك بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:hashtak"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التاك").lockKtm,"md",true)  
return false
end 
if text == "قفل التاك بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:hashtak"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التاك").lockKick,"md",true)  
return false
end 
if text == "فتح التاك" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:hashtak"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح التاك").unLock,"md",true)  
return false
end 
if text == "قفل الشارحه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Cmd"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الشارحه").Lock,"md",true)  
return false
end 
if text == "قفل الشارحه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Cmd"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الشارحه").lockKid,"md",true)  
return false
end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Cmd"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الشارحه").lockKtm,"md",true)  
return false
end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Cmd"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الشارحه").lockKick,"md",true)  
return false
end 
if text == "فتح الشارحه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Cmd"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الشارحه").unLock,"md",true)  
return false
end 
if text == "قفل الصور"then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Photo"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الصور").Lock,"md",true)  
return false
end 
if text == "قفل الصور بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Photo"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الصور").lockKid,"md",true)  
return false
end 
if text == "قفل الصور بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Photo"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الصور").lockKtm,"md",true)  
return false
end 
if text == "قفل الصور بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Photo"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الصور").lockKick,"md",true)  
return false
end 
if text == "فتح الصور" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Photo"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الصور").unLock,"md",true)  
return false
end 
if text == "قفل الفيديو" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Video"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الفيديو").Lock,"md",true)  
return false
end 
if text == "قفل الفيديو بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Video"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الفيديو").lockKid,"md",true)  
return false
end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Video"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الفيديو").lockKtm,"md",true)  
return false
end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Video"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الفيديو").lockKick,"md",true)  
return false
end 
if text == "فتح الفيديو" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Video"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الفيديو").unLock,"md",true)  
return false
end 
if text == "قفل المتحركه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Animation"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل المتحركه").Lock,"md",true)  
return false
end 
if text == "قفل المتحركه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Animation"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل المتحركه").lockKid,"md",true)  
return false
end 
if text == "قفل المتحركه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 ??𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Animation"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل المتحركه").lockKtm,"md",true)  
return false
end 
if text == "قفل المتحركه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Animation"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل المتحركه").lockKick,"md",true)  
return false
end 
if text == "فتح المتحركه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Animation"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح المتحركه").unLock,"md",true)  
return false
end 
if text == "قفل الالعاب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:geam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الالعاب").Lock,"md",true)  
return false
end 
if text == "قفل الالعاب بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:geam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الالعاب").lockKid,"md",true)  
return false
end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:geam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الالعاب").lockKtm,"md",true)  
return false
end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:geam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الالعاب").lockKick,"md",true)  
return false
end 
if text == "فتح الالعاب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:geam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الالعاب").unLock,"md",true)  
return false
end 
if text == "قفل الاغاني" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Audio"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الاغاني").Lock,"md",true)  
return false
end 
if text == "قفل الاغاني بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Audio"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الاغاني").lockKid,"md",true)  
return false
end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Audio"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الاغاني").lockKtm,"md",true)  
return false
end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Audio"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الاغاني").lockKick,"md",true)  
return false
end 
if text == "فتح الاغاني" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Audio"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الاغاني").unLock,"md",true)  
return false
end 
if text == "قفل الصوت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:vico"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الصوت").Lock,"md",true)  
return false
end 
if text == "قفل الصوت بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:vico"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الصوت").lockKid,"md",true)  
return false
end 
if text == "قفل الصوت بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:vico"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الصوت").lockKtm,"md",true)  
return false
end 
if text == "قفل الصوت بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:vico"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الصوت").lockKick,"md",true)  
return false
end 
if text == "فتح الصوت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ ??𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:vico"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الصوت").unLock,"md",true)  
return false
end 
if text == "قفل الكيبورد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Keyboard"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الكيبورد").Lock,"md",true)  
return false
end 
if text == "قفل الكيبورد بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Keyboard"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الكيبورد").lockKid,"md",true)  
return false
end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Keyboard"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الكيبورد").lockKtm,"md",true)  
return false
end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Keyboard"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الكيبورد").lockKick,"md",true)  
return false
end 
if text == "فتح الكيبورد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Keyboard"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الكيبورد").unLock,"md",true)  
return false
end 
if text == "قفل الملصقات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Sticker"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الملصقات").Lock,"md",true)  
return false
end 
if text == "قفل الملصقات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Sticker"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الملصقات").lockKid,"md",true)  
return false
end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Sticker"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الملصقات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Sticker"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الملصقات").lockKick,"md",true)  
return false
end 
if text == "فتح الملصقات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Sticker"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الملصقات").unLock,"md",true)  
return false
end 
if text == "قفل التوجيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:forward"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التوجيه").Lock,"md",true)  
return false
end 
if text == "قفل التوجيه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:forward"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التوجيه").lockKid,"md",true)  
return false
end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:forward"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التوجيه").lockKtm,"md",true)  
return false
end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:forward"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل التوجيه").lockKick,"md",true)  
return false
end 
if text == "فتح التوجيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:forward"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح التوجيه").unLock,"md",true)  
return false
end 
if text == "قفل الملفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Document"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الملفات").Lock,"md",true)  
return false
end 
if text == "قفل الملفات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Document"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الملفات").lockKid,"md",true)  
return false
end 
if text == "قفل الملفات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Document"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الملفات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملفات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Document"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الملفات").lockKick,"md",true)  
return false
end 
if text == "فتح الملفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Document"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الملفات").unLock,"md",true)  
return false
end 
if text == "قفل السيلفي" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Unsupported"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل السيلفي").Lock,"md",true)  
return false
end 
if text == "قفل السيلفي بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Unsupported"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل السيلفي").lockKid,"md",true)  
return false
end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Unsupported"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل السيلفي").lockKtm,"md",true)  
return false
end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Unsupported"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل السيلفي").lockKick,"md",true)  
return false
end 
if text == "فتح السيلفي" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Unsupported"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح السيلفي").unLock,"md",true)  
return false
end 
if text == "قفل الماركداون" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Markdaun"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الماركداون").Lock,"md",true)  
return false
end 
if text == "قفل الماركداون بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Markdaun"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الماركداون").lockKid,"md",true)  
return false
end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Markdaun"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الماركداون").lockKtm,"md",true)  
return false
end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Markdaun"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الماركداون").lockKick,"md",true)  
return false
end 
if text == "فتح الماركداون" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Markdaun"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الماركداون").unLock,"md",true)  
return false
end 
if text == "قفل الجهات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Contact"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الجهات").Lock,"md",true)  
return false
end 
if text == "قفل الجهات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Contact"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الجهات").lockKid,"md",true)  
return false
end 
if text == "قفل الجهات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Contact"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الجهات").lockKtm,"md",true)  
return false
end 
if text == "قفل الجهات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Contact"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الجهات").lockKick,"md",true)  
return false
end 
if text == "فتح الجهات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Contact"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الجهات").unLock,"md",true)  
return false
end 
if text == "قفل الكلايش" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Spam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الكلايش").Lock,"md",true)  
return false
end 
if text == "قفل الكلايش بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Spam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الكلايش").lockKid,"md",true)  
return false
end 
if text == "قفل الكلايش بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Spam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الكلايش").lockKtm,"md",true)  
return false
end 
if text == "قفل الكلايش بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Spam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الكلايش").lockKick,"md",true)  
return false
end 
if text == "فتح الكلايش" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Spam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الكلايش").unLock,"md",true)  
return false
end 
if text == "قفل الانلاين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Inlen"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الانلاين").Lock,"md",true)  
return false
end 
if text == "قفل الانلاين بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Inlen"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الانلاين").lockKid,"md",true)  
return false
end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Inlen"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الانلاين").lockKtm,"md",true)  
return false
end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Lock:Inlen"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم قفل الانلاين").lockKick,"md",true)  
return false
end 
if text == "فتح الانلاين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Lock:Inlen"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"-تم فتح الانلاين").unLock,"md",true)  
return false
end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Set:Link"..msg_chat_id..""..msg.sender.user_id,120,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل رابط المجموعة او رابط قناة المجموعة","md",true)  
end
if text == "مسح الرابط" or text == "حذف الرابط" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Group:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم مسح الرابط ","md",true)             
end
if text == "الرابط" then
if not Redis:get(TheMaLaTH.."MaLaTH:Status:Link"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل جلب الرابط من قبل الادمنيه","md",true)
end 
local Get_Chat = LuaTele.getChat(msg_chat_id)
local GetLink = Redis:get(TheMaLaTH.."MaLaTH:Group:Link"..msg_chat_id) 
if GetLink then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ { text =Get_Chat.title, url = GetLink }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, "-Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠᅠᅠᅠ‹ ["..Get_Chat.title.. ']('..GetLink..') ›', 'md', true, false, false, false, reply_markup)
else
local LinkGroup = LuaTele.generateChatInviteLink(msg_chat_id,'taha',tonumber(msg.date+86400),100,false)
if LinkGroup.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",true)
end
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ { text = Get_Chat.title, url = LinkGroup.invite_link }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, "-Link Group ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nᅠᅠᅠᅠ‹ ["..Get_Chat.title.. ']('..LinkGroup.invite_link..') ›', 'md', true, false, false, false, reply_markup)
end
end

if text == "ضع ترحيب" or text == "وضع ترحيب" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id, 120, true)  
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي الترحيب الان".."\n-تستطيع اضافة مايلي !\n-دالة عرض الاسم ↫ ‹ `name` ›\n-دالة عرض المعرف ↫ ‹ `user` ›\n-دالة عرض اسم المجموعة ↫ ‹ `NameCh` ›","md",true)   
end
if text == "الترحيب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(TheMaLaTH.."MaLaTH:Status:Welcome"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل الترحيب من قبل الادمنيه","md",true)
end 
local Welcome = Redis:get(TheMaLaTH.."MaLaTH:Welcome:Group"..msg_chat_id)
if Welcome then 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return LuaTele.sendText(msg_chat_id,msg_id,"-لم يتم تعيين ترحيب للمجموعة","md",true)   
end 
end
if text == "مسح الترحيب" or text == "حذف الترحيب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Welcome:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم ازالة ترحيب المجموعة","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي القوانين الان","md",true)  
end
if text == "مسح القوانين" or text == "حذف القوانين" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Group:Rules"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم ازالة قوانين المجموعة","md",true)    
end
if text == "القوانين" then 
local Rules = Redis:get(TheMaLaTH.."MaLaTH:Group:Rules" .. msg_chat_id)   
if Rules then     
return LuaTele.sendText(msg_chat_id,msg_id,Rules,"md",true)     
else      
return LuaTele.sendText(msg_chat_id,msg_id,"-لا توجد قوانين هنا","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:setex(TheMaLaTH.."MaLaTH:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي وصف المجموعة الان","md",true)  
end
if text == "مسح الوصف" or text == "حذف الوصف" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
LuaTele.setChatDescription(msg_chat_id, '') 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم ازالة قوانين المجموعة","md",true)    
end

if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
LuaTele.setChatTitle(msg_chat_id,NameChat)
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تغيير اسم المجموعة الى : "..NameChat,"md",true)    
end

if text == ("ضع صوره") then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:set(TheMaLaTH.."MaLaTH:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الصوره لوضعها","md",true)    
end

if text == "مسح قائمه المنع" or text == "مسح قائمة المنع" then   
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"*-لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(TheMaLaTH.."MaLaTH:Filter:Group:"..v..msg_chat_id)  
Redis:srem(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id,v)  
end  
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ("..#list..") من الممنوعات *","md",true)   
end
if text == "قائمه المنع" or text == "قائمة المنع" then   
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"*-لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
Filter = '\n*-قائمه المنع \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k,v in pairs(list) do  
print(v)
if v:match('photo:(.*)') then
ver = 'صوره'
elseif v:match('animation:(.*)') then
ver = 'متحركه'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(TheMaLaTH.."MaLaTH:Filter:Group:"..v..msg_chat_id)   
Filter = Filter.."*"..k.."-"..ver.." ↫ { "..Text_Filter.." }*\n"    
end  
LuaTele.sendText(msg_chat_id,msg_id,Filter,"md",true)  
end  
if text == "منع" then       
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH..'MaLaTH:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true')
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-ارسل الان { ملصق ,متحركه ,صوره ,رساله } *',"md",true)  
end    
if text == "الغاء منع" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH..'MaLaTH:FilterText'..msg_chat_id..':'..msg.sender.user_id,'DelFilter')
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-ارسل الان { ملصق ,متحركه ,صوره ,رساله } *',"md",true)  
end

if text == "اضف امر" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"-الان ارسل لي الامر القديم","md",true)
end
if text == "حذف امر" or text == "مسح امر" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الان الامر الذي قمت بوضعه مكان الامر القديم","md",true)
end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(TheMaLaTH.."MaLaTH:Command:List:Group"..msg_chat_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"-تم مسح جميع الاوامر التي تم اضافتها","md",true)
end
if text == "الاوامر المضافه" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:Command:List:Group"..msg_chat_id.."")
Command = "-قائمه الاوامر المضافه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
Commands = Redis:get(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k..": ( "..v.." ) ↫ ( "..Commands.." )\n"
else
Command = Command..""..k..": ( "..v.." ) \n"
end
end
if #list == 0 then
Command = "-لا توجد اوامر اضافيه"
end
return LuaTele.sendText(msg_chat_id,msg_id,Command,"md",true)
end

if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n-تم تثبيت الرساله","md",true)
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Message_Reply.id,true)
end
if text == 'الغاء التثبيت' and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n-تم الغاء تثبيت الرساله","md",true)
https.request('https://api.telegram.org/bot'..Token..'/unpinAllChatMessages?chat_id='..msg.chat_id)
LuaTele.unpinChatMessage(msg_chat_id) 
end
if text == 'الغاء تثبيت الكل' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n-تم الغاء تثبيت جميع الرسائل","md",true)
https.request('https://api.telegram.org/bot'..Token..'/unpinAllChatMessages?chat_id='..msg.chat_id)
for i=0, 20 do
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if not LuaTele.getChatPinnedMessage(msg_chat_id).id then
break
end
end
end
if text == "الحمايه" or text == "الحماية" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = 'تعطيل الرابط', data = msg.sender.user_id..'/'.. 'unmute_link' },{ text = 'تفعيل الرابط', data = msg.sender.user_id..'/'.. 'mute_link' },
 },
{ 
{ text = 'تعطيل الترحيب', data = msg.sender.user_id..'/'.. 'unmute_welcome' },{ text = 'تفعيل الترحيب', data = msg.sender.user_id..'/'.. 'mute_welcome' },
 },
{ 
{ text = 'تعطيل الايدي', data = msg.sender.user_id..'/'.. 'unmute_Id' },{ text = 'تفعيل الايدي', data = msg.sender.user_id..'/'.. 'mute_Id' },
 },
{ 
{ text = 'تعطيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'unmute_IdPhoto' },{ text = 'تفعيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'mute_IdPhoto' },
 },
{ 
{ text = 'تعطيل ردود المدير', data = msg.sender.user_id..'/'.. 'unmute_ryple' },{ text = 'تفعيل ردود المدير', data = msg.sender.user_id..'/'.. 'mute_ryple' },
 },
{ 
{ text = 'تعطيل ردود المطور', data = msg.sender.user_id..'/'.. 'unmute_ryplesudo' },{ text = 'تفعيل ردود المطور', data = msg.sender.user_id..'/'.. 'mute_ryplesudo' },
 },
{ 
{ text = 'تعطيل الرفع', data = msg.sender.user_id..'/'.. 'unmute_setadmib' },{ text = 'تفعيل الرفع', data = msg.sender.user_id..'/'.. 'mute_setadmib' },
 },
{ 
{ text = 'تعطيل الطرد', data = msg.sender.user_id..'/'.. 'unmute_kickmembars' },{ text = 'تفعيل الطرد', data = msg.sender.user_id..'/'.. 'mute_kickmembars' },
 },
{ 
{ text = 'تعطيل الالعاب', data = msg.sender.user_id..'/'.. 'unmute_games' },{ text = 'تفعيل الالعاب', data = msg.sender.user_id..'/'.. 'mute_games' },
 },
{ 
{ text = 'تعطيل اطردني', data = msg.sender.user_id..'/'.. 'unmute_kickme' },{ text = 'تفعيل اطردني', data = msg.sender.user_id..'/'.. 'mute_kickme' },
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr' }
 },
 }
 }
return LuaTele.sendText(msg_chat_id, msg_id, '-اوامر التفعيل والتعطيل الخاصة بالمجموعة ↫ ⤈', 'md', false, false, false, false, reply_markup)
end  
if text == 'اعدادات الحمايه' then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:Link"..msg.chat_id) then
Statuslink = '‹ ✓ ›' else Statuslink = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:Welcome"..msg.chat_id) then
StatusWelcome = '‹ ✓ ›' else StatusWelcome = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:Id"..msg.chat_id) then
StatusId = '‹ ✓ ›' else StatusId = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '‹ ✓ ›' else StatusIdPhoto = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:Reply"..msg.chat_id) then
StatusReply = '‹ ✓ ›' else StatusReply = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '‹ ✓ ›' else StatusReplySudo = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:BanId"..msg.chat_id)  then
StatusBanId = '‹ ✓ ›' else StatusBanId = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:SetId"..msg.chat_id) then
StatusSetId = '‹ ✓ ›' else StatusSetId = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
StatusGames = '‹ ✓ ›' else StatusGames = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:KickMe"..msg.chat_id) then
Statuskickme = '‹ ✓ ›' else Statuskickme = '‹ ✗ ›'
end
if Redis:get(TheMaLaTH.."MaLaTH:Status:AddMe"..msg.chat_id) then
StatusAddme = '‹ ✓ ›' else StatusAddme = '‹ ✗ ›'
end
local protectionGroup = '\n*-اعدادات حمايه المجموعة\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
..'\n-جلب الرابط ↫ '..Statuslink
..'\n-جلب الترحيب ↫ '..StatusWelcome
..'\n-الايدي ↫ '..StatusId
..'\n-الايدي بالصوره ↫ '..StatusIdPhoto
..'\n-ردود المدير ↫ '..StatusReply
..'\n-ردود المطور ↫ '..StatusReplySudo
..'\n-الرفع ↫ '..StatusSetId
..'\n-الحظر -الطرد ↫ '..StatusBanId
..'\n-الالعاب ↫ '..StatusGames
..'\n-امر اطردني ↫ '..Statuskickme..'*\n\n'
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup)
end
if text == "الاعدادات" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Text = "*\n-اعدادات المجموعة ".."\n-علامة ال (✓) تعني مقفول".."\n-علامة ال (✗) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = GetSetieng(msg_chat_id).lock_links, data = '&' },{ text = 'الروابط : ', data =msg.sender.user_id..'/'.. 'Status_link' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_spam, data = '&' },{ text = 'الكلايش : ', data =msg.sender.user_id..'/'.. 'Status_spam' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_inlin, data = '&' },{ text = 'الكيبورد : ', data =msg.sender.user_id..'/'.. 'Status_keypord' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_vico, data = '&' },{ text = 'الاغاني : ', data =msg.sender.user_id..'/'.. 'Status_voice' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_gif, data = '&' },{ text = 'المتحركه : ', data =msg.sender.user_id..'/'.. 'Status_gif' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_file, data = '&' },{ text = 'الملفات : ', data =msg.sender.user_id..'/'.. 'Status_files' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_text, data = '&' },{ text = 'الدردشه : ', data =msg.sender.user_id..'/'.. 'Status_text' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_ved, data = '&' },{ text = 'الفيديو : ', data =msg.sender.user_id..'/'.. 'Status_video' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_photo, data = '&' },{ text = 'الصور : ', data =msg.sender.user_id..'/'.. 'Status_photo' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_user, data = '&' },{ text = 'المعرفات : ', data =msg.sender.user_id..'/'.. 'Status_username' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_hash, data = '&' },{ text = 'التاك : ', data =msg.sender.user_id..'/'.. 'Status_tags' },
 },
{ 
{ text = GetSetieng(msg_chat_id).lock_bots, data = '&' },{ text = 'البوتات : ', data =msg.sender.user_id..'/'.. 'Status_bots' },
 },
{ 
{ text = 'التالي', data =msg.sender.user_id..'/'.. 'NextSeting' }
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr' }
 },
 }
 }
return LuaTele.sendText(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup)
end  


if text == 'المجموعة' or text == 'المجموعه' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '‹ ✓ ›' else web = '‹ ✗ ›'
end
if Get_Chat.permissions.can_change_info then
info = '‹ ✓ ›' else info = '‹ ✗ ›'
end
if Get_Chat.permissions.can_invite_users then
invite = '‹ ✓ ›' else invite = '‹ ✗ ›'
end
if Get_Chat.permissions.can_pin_messages then
pin = '‹ ✓ ›' else pin = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_media_messages then
media = '‹ ✓ ›' else media = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_messages then
messges = '‹ ✓ ›' else messges = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_other_messages then
other = '‹ ✓ ›' else other = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_polls then
polls = '‹ ✓ ›' else polls = '‹ ✗ ›'
end
local permissions = '*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n-صلاحيات المجموعة ↫ ⤈'..'\n-تغيير معلومات المجموعة : '..info..'\n-اضافه مستخدمين : '..invite..'\n-تثبيت الرسائل : '..pin..'\n-ارسال الميديا : '..media..'\n-ارسال الرسائل : '..messges..'\n-اضافه البوتات : '..other..'\n-ارسال الويب : '..web..'\n-ارسال استفتاء : '..polls..'*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
local TextChat = '*\n-معلومات المجموعة :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..' \n-عدد الادمنيه : ‹ '..Info_Chats.administrator_count..' ›\n-عدد المحظورين : ‹ '..Info_Chats.banned_count..' ›\n-عدد الاعضاء : ‹ '..Info_Chats.member_count..' ›\n-عدد المقيديين : ‹ '..Info_Chats.restricted_count..' ›\n-اسم المجموعة : ‹* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ›*'
return LuaTele.sendText(msg_chat_id,msg_id, TextChat..permissions,"md",true)
end
if text == 'صلاحيات المجموعة' or text == 'صلاحيات المجموعه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '‹ ✓ ›' else web = '‹ ✗ ›'
end
if Get_Chat.permissions.can_change_info then
info = '‹ ✓ ›' else info = '‹ ✗ ›'
end
if Get_Chat.permissions.can_invite_users then
invite = '‹ ✓ ›' else invite = '‹ ✗ ›'
end
if Get_Chat.permissions.can_pin_messages then
pin = '‹ ✓ ›' else pin = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_media_messages then
media = '‹ ✓ ›' else media = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_messages then
messges = '‹ ✓ ›' else messges = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_other_messages then
other = '‹ ✓ ›' else other = '‹ ✗ ›'
end
if Get_Chat.permissions.can_send_polls then
polls = '‹ ✓ ›' else polls = '‹ ✗ ›'
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = ' تغيير معلومات المجموعة : '..info, data =msg.sender.user_id..  '/info' }, 
 },
{ 
{ text = ' اضافه مستخدمين : '..invite, data =msg.sender.user_id..  '/invite' }, 
 },
{ 
{ text = ' تثبيت الرسائل : '..pin, data =msg.sender.user_id..  '/pin' }, 
 },
{ 
{ text = ' ارسال الميديا : '..media, data =msg.sender.user_id..  '/media' }, 
 },
{ 
{ text = ' ارسال الرسائل : '..messges, data =msg.sender.user_id..  '/messges' }, 
 },
{ 
{ text = ' اضافه البوتات : '..other, data =msg.sender.user_id..  '/other' }, 
 },
 { 
{ text = ' ارسال الويب : '..web, data = msg.sender.user_id..'/web' }, 
 },
{ 
{ text = ' ارسال استفتاء : '..polls, data =msg.sender.user_id.. '/polls' }, 
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. '/delAmr' }
 },
 }
 }
return LuaTele.sendText(msg_chat_id, msg_id, "-صلاحيات المجموعة ↫ ⤈", 'md', false, false, false, false, reply_markup)
end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",Message_Reply.sender.user_id) then
dev = "المطور-" else dev = "" end
if Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
crr = "منشئ اساسي-" else crr = "" end
if Redis:sismember(TheMaLaTH..'MaLaTH:Originators:Group'..msg_chat_id, Message_Reply.sender.user_id) then
cr = "منشئ-" else cr = "" end
if Redis:sismember(TheMaLaTH..'MaLaTH:Managers:Group'..msg_chat_id, Message_Reply.sender.user_id) then
own = "مدير-" else own = "" end
if Redis:sismember(TheMaLaTH..'MaLaTH:Addictive:Group'..msg_chat_id, Message_Reply.sender.user_id) then
mod = "ادمن-" else mod = "" end
if Redis:sismember(TheMaLaTH..'MaLaTH:Distinguished:Group'..msg_chat_id, Message_Reply.sender.user_id) then
vip = "مميز-" else vip = ""
end
if The_ControllerAll(Message_Reply.sender.user_id) == true then
Rink = 1
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",Message_Reply.sender.user_id)  then
Rink = 2
elseif Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 3
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 4
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 5
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 6
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 7
else
Rink = 8
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-ليس لديه اي رتبه هنا *","md",true)  
end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Developers:Groups",Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Developers then
if Rink == 2 or Rink < 2 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.TheBasics then
if Rink == 3 or Rink < 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Originators then
if Rink == 4 or Rink < 4 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Managers then
if Rink == 5 or Rink < 5 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Addictive then
if Rink == 6 or Rink < 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-تم تنزيل الشخص من الرتب التاليه ‹ "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." * ›","md",true)  
end

if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
if Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",UserId_Info.id) then
dev = "المطور-" else dev = "" end
if Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
crr = "منشئ اساسي-" else crr = "" end
if Redis:sismember(TheMaLaTH..'MaLaTH:Originators:Group'..msg_chat_id, UserId_Info.id) then
cr = "منشئ-" else cr = "" end
if Redis:sismember(TheMaLaTH..'MaLaTH:Managers:Group'..msg_chat_id, UserId_Info.id) then
own = "مدير-" else own = "" end
if Redis:sismember(TheMaLaTH..'MaLaTH:Addictive:Group'..msg_chat_id, UserId_Info.id) then
mod = "ادمن-" else mod = "" end
if Redis:sismember(TheMaLaTH..'MaLaTH:Distinguished:Group'..msg_chat_id, UserId_Info.id) then
vip = "مميز-" else vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Developers:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
Rink = 3
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id, UserId_Info.id) then
Rink = 4
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
else
Rink = 8
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-ليس لديه اي رتبه هنا *","md",true)  
end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Developers:Groups",UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Developers then
if Rink == 2 or Rink < 2 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.TheBasics then
if Rink == 3 or Rink < 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Originators then
if Rink == 4 or Rink < 4 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Managers then
if Rink == 5 or Rink < 5 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Addictive then
if Rink == 6 or Rink < 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id, UserId_Info.id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-تم تنزيل الشخص من الرتب التاليه ‹ "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." * ›","md",true)  
end

if text == ('رفع مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{ 1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, '' })
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ تعديل الصلاحيات ›', data = msg.sender.user_id..'/groupNumseteng//'..Message_Reply.sender.user_id }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id, msg_id, "-يمكنك تعديل صلاحيات المستخدم", 'md', false, false, false, false, reply_markup)
end
if text and text:match('^رفع مشرف @(%S+)$') then
local UserName = text:match('^رفع مشرف @(%S+)$')
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{ 1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, '' })
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ تعديل الصلاحيات ›', data = msg.sender.user_id..'/groupNumseteng//'..UserId_Info.id }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id, msg_id, "-يمكنك تعديل صلاحيات المستخدم", 'md', false, false, false, false, reply_markup)
end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{ 0 ,0, 0, 0, 0, 0, 0 ,0, 0 })
if SetAdmin.code == 400 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم تنزيله من المشرفين ").Reply,"md",true)  
end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{ 0 ,0, 0, 0, 0, 0, 0 ,0, 0 })
if SetAdmin.code == 400 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"-تم تنزيله من المشرفين ").Reply,"md",true)  
end 
if text == 'مسح جهاتي' then
Redis:del(TheMaLaTH..'MaLaTH:Num:Add:Memp'..msg.chat_id..msg.sender.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'-تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'رسائلي' then
LuaTele.sendText(msg_chat_id,msg_id,'-عدد رسائلك هنا ‹ *'..(Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) or 0)..'* ›',"md",true)  
elseif text == 'سحكاتي' or text == 'تعديلاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'-عدد التعديلات هنا ‹ *'..(Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..msg.chat_id..msg.sender.user_id) or 0)..'* ›',"md",true)  
elseif text == 'جهاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'-عدد جهاتك المضافه هنا ‹ *'..(Redis:get(TheMaLaTH.."MaLaTH:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0)..'* ›',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Addictive then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg.reply_to_message_id })
LuaTele.deleteMessages(msg.chat_id,{ [1]= msg_id })
end
if text == 'تعين الايدي عام' or text == 'تغير الايدي عام' or text == 'وضع الايدي عام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Set:Id:Groups"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل الان النص
-يمكنك اضافه :
-`#username` ↫ اسم المستخدم
-`#msgs` ↫ عدد الرسائل
-`#photos` ↫ عدد الصور
-`#id` ↫ ايدي المستخدم
-`#auto` ↫ نسبة التفاعل
-`#stast` ↫ رتبة المستخدم 
-`#edit` ↫ عدد السحكات
-`#game` ↫ عدد المجوهرات
-`#AddMem` ↫ عدد الجهات
-`#Description` ↫ تعليق الصوره
]],"md",true)    
end 
if text == 'حذف الايدي عام' or text == 'مسح الايدي عام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Set:Id:Groups")
return LuaTele.sendText(msg_chat_id,msg_id, '-تم ازالة كليشة الايدي العامه',"md",true)  
end

if text == 'تعين الايدي' or text == 'تعيين الايدي' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل الان النص
-يمكنك اضافه :
-`#username` ↫ اسم المستخدم
-`#msgs` ↫ عدد الرسائل
-`#photos` ↫ عدد الصور
-`#id` ↫ ايدي المستخدم
-`#auto` ↫ نسبة التفاعل
-`#stast` ↫ رتبة المستخدم 
-`#edit` ↫ عدد السحكات
-`#game` ↫ عدد المجوهرات
-`#AddMem` ↫ عدد الجهات
-`#Description` ↫ تعليق الصوره
]],"md",true)    
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Set:Id:Group"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, '-تم ازالة كليشة الايدي ',"md",true)  
end

if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الثانوين' or TextMsg == 'المطورين الثانويين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مطورين ثانوين حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المطورين الثانويين*","md",true)
end
if TextMsg == 'المطورين' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مطورين حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true)
end
if TextMsg == 'المالكين' then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(3)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'\n*-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مالكين في البوت ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المالكين *","md",true)
end
if TextMsg == 'المنشئين الاساسيين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد منشئين اساسيين حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المنشؤين الاساسيين *","md",true)
end
if TextMsg == 'المنشئين' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(4)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد منشئين حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المنشئين *","md",true)
end
if TextMsg == 'المدراء' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(5)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مدراء حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المدراء *","md",true)
end
if TextMsg == 'الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد ادمنيه حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من الادمنيه *","md",true)
end
if TextMsg == 'المميزين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مميزين حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المميزين *","md",true)
end
if TextMsg == 'المحظورين عام' or TextMsg == 'قائمه العام' or TextMsg == 'قائمة العام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(2)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد محظورين عام حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المحظورين عام *","md",true)
end
if TextMsg == 'المحظورين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد محظورين حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المحظورين *","md",true)
end
if TextMsg == 'المكتومين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مكتومين حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المكتومين *","md",true)
end
if TextMsg == 'المقيدين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{ 1,1,1,1,1,1,1,1 })
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..x.." › من المقيديين *","md",true)
end
if TextMsg == 'البوتات' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.luatele == "ok" then
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عدد البوتات الموجوده : "..#List_Members.."\n-تم طرد ( "..x.." ) بوت من المجموعة *","md",true)  
end
if TextMsg == 'المطرودين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Banned", "*", 0, 200)
x = 0
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{ 1,1,1,1,1,1,1,1,1 })
if UNBan_Bots.luatele == "ok" then
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عدد المطرودين في الموجوده : "..#List_Members.."\n-تم الغاء الحظر عن ( "..x.." ) من الاشخاص*","md",true)  
end
if TextMsg == 'المحذوفين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.type.luatele == "userTypeDeleted" then
local userTypeDeleted = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.luatele == "ok" then
x = x + 1
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-تم طرد ( "..x.." ) حساب محذوف *","md",true)  
end
end

--Lar Managers --

if text == ("الردود المتعدده") or text == ("مسح الردود المتعدده") or text == ("حذف الردود المتعدده") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local R = Redis:scard(TheMaLaTH.."MaLaTH1:List:Rd:Sudo"..msg.chat_id)
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = {
{
{ text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RdLaR' },{ text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/Rdlar' },
}, 
{ 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr' }
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
} 
}
return LuaTele.sendText(msg_chat_id, msg_id, "-من خلال الازرار يمكن عرض وحذف الردود", 'md', false, false, false, false, reply_markup)
end

--

if text == ("ردود المدير") or text == ("مسح ردود المدير") or text == ("حذف ردود المدير") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local R = Redis:scard(TheMaLaTH.."MaLaTH:List:Manager"..msg_chat_id.."")
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = {
{
{ text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RD' },{ text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RRD' },
}, 
{ 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr' }
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
} 
}
return LuaTele.sendText(msg_chat_id, msg_id, "-من خلال الازرار يمكن عرض وحذف الردود", 'md', false, false, false, false, reply_markup)
end


--Lar Managers end --


if text == "اضف رد" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الان الكلمه لاضافتها في ردود المدير ","md",true)  
end
if text == "حذف رد" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true2")
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الان الكلمه لحذفها من ردود المدير","md",true)  
end


--Lar Sudo --


if text == ("الردود المتعدده العامه") or text == ("مسح الردود المتعدده العامه") or text == ("حذف الردود المتعدده العامه") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local R = Redis:scard(TheMaLaTH.."MaLaTH11:List:Rd:Sudo")
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = {
{
{ text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RSoLaR' },{ text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RSolar' },
}, 
{ 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr' }
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
} 
}
return LuaTele.sendText(msg_chat_id, msg_id, "-من خلال الازرار يمكن عرض وحذف الردود", 'md', false, false, false, false, reply_markup)
end

--

if text == ("ردود المطور") or text == ("مسح الردود العامه") or text == ("حذف الردود العامه") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local R = Redis:scard(TheMaLaTH.."MaLaTH:List:Rd:Sudo")
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = {
{
{ text = '‹ حذف الردود : '..R..' ›', data = msg.sender.user_id..'/RDs' },{ text = '‹ عرض الردود : '..R..' ›', data = msg.sender.user_id..'/RRDs' },
}, 
{ 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr' }
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
} 
}
return LuaTele.sendText(msg_chat_id, msg_id, "-من خلال الازرار يمكن عرض وحذف الردود", 'md', false, false, false, false, reply_markup)
end


--Lar Sudo end --


if text == "اضف رد للكل" or text == "اضف رد عام" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الان الكلمه لاضافتها في ردود المطور ","md",true)  
end
if text == "حذف رد للكل" or text == "حذف رد عام"then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الان الكلمه لحذفها من ردود المطور","md",true)  
end
if text=="اذاعه خاص" or text=="اذاعة خاص" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل لي سواء كان 
‹ ملف-ملصق-متحركه-صوره
-فيديو-بصمه الفيديو-بصمه-صوت-رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه" or text=="اذاعة" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل لي سواء كان 
‹ ملف-ملصق-متحركه-صوره
-فيديو-بصمه الفيديو-بصمه-صوت-رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت" or text=="اذاعة بالتثبيت"then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل لي سواء كان 
‹ ملف-ملصق-متحركه-صوره
-فيديو-بصمه الفيديو-بصمه-صوت-رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه" or text=="اذاعة بالتوجيه"then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي التوجيه الان\n-ليتم نشره في المجموعات","md",true)  
return false
end

if text=="اذاعه خاص بالتوجيه" or text=="اذاعة خاص بالتوجيه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي التوجيه الان\n-ليتم نشره الى المشتركين","md",true)  
return false
end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*-معلومات الكشف \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n-الحظر العام : '..BanAll..'\n-الحظر : '..BanGroup..'\n-الكتم : '..SilentGroup..'\n-التقييد : '..Restricted..'*',"md",true)  
end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*-معلومات الكشف \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n-الحظر العام : '..BanAll..'\n-الحظر : '..BanGroup..'\n-الكتم : '..SilentGroup..'\n-التقييد : '..Restricted..'*',"md",true)  
end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{ 1,1,1,1,1,1,1,1 })
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true and msg.ControllerBot then
BanAll = 'محظور عام ,'
Redis:srem(TheMaLaTH.."MaLaTH:BanAll:Groups",Message_Reply.sender.user_id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*-تم رفع القيود عنه : { "..BanAll..BanGroup..SilentGroup..Restricted..' }*',"md",true)  
end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-عذراً البوت ليس ادمن في المجموعة يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{ 1,1,1,1,1,1,1,1 })
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.ControllerBot then
BanAll = 'محظور عام ,'
Redis:srem(TheMaLaTH.."MaLaTH:BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(TheMaLaTH.."MaLaTH:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(TheMaLaTH.."MaLaTH:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*-تم رفع القيود عنه : { "..BanAll..BanGroup..SilentGroup..Restricted..' }*',"md",true)  
end

if text == 'وضع كليشه المطور' or text == 'وضع كليشة المطور' or text == 'ضع كليشة المطور' or text == 'ضع كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH..'MaLaTH:GetTexting:DevTheMaLaTH'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,'-ارسل لي الكليشه الان')
end
if text == 'مسح كليشة المطور' or text == 'حذف كليشة المطور' or text == 'مسح كليشه المطور' or text == 'حظف كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH..'MaLaTH:Texting:DevTheMaLaTH')
return LuaTele.sendText(msg_chat_id,msg_id,'-تم حذف كليشه المطور')
end
if text == 'المطور' or text == 'مطور' then   
local UserInfo = LuaTele.getUser(Sudo_Id) 
local InfoUser = LuaTele.getUserFullInfo(Sudo_Id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = LuaTele.getUserProfilePhotos(Sudo_Id)
if photo.total_count > 0 then
local TestText = "  ❲ Developers Bot ❳\n━═━═━═━═━\n⌔︰*Dev Name* :  ["..UserInfo.first_name.."](tg://user?id="..Sudo_Id..")\n⌔︰*Dev Bio* : [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '٬ 𝙊𝙗𝙖 𝙇𝙖𝙍𝙞𝙘𝙖 🕷 ٫', url = "https://t.me/MaLaTHTEAM"}
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "  ❲ Developers Source ❳\n━═━═━═━═━\n⌔︰*Dev Name* :  ["..UserInfo.first_name.."](tg://user?id="..Sudo_Id..")\n⌔︰*Dev Bio* : [❲ "..Bio.." ❳]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
if text == "جمالي" or text == 'نسبه جمالي' or text == 'نسبة جمالي' then
if Redis:get(TheMaLaTH.."MaLaTH:Status:gamle"..msg.chat_id) then
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
if msg.Developers then
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي 900% عشان مطور لازم اضبطك*", "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*-لا توجد صوره في حسابك*',"md",true) 
end
else
if photo.total_count > 0 then
local nspp = { "10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0", }
local rdbhoto = nspp[math.random(#nspp)]
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي "..rdbhoto.."% *", "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*-لا توجد صوره في حسابك*',"md",true) 
end
end
end
end
if text and text:match("^كول (.*)$")then
local m = text:match("^كول (.*)$")
if Redis:get(TheMaLaTH.."MaLaTH:Status:kool"..msg.chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,m,"md",true) 
end
end
if text == "صورتي" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:photo"..msg.chat_id) then
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*-عدد صورك هو "..photo.total_count.." صوره*", "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*-لا توجد صوره في حسابك*',"md",true) 
end
end
end

if text == "بوت الزخرفه-" or text == "بوت الزخرفه" or text == "بوت زخرفه" then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '‹ اضغط هنا ›', url = 't.me/BBC4BOT'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'*-اضغط للحصول على بوت الزخرفه*',"md",false, false, false, false, reply_markup)
end
if text == "بوت الكت-" or text == "بوت الكت" or text == "بوت كت" then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '‹ اضغط هنا ›', url = 't.me/OXX3BOT'},},}}
return LuaTele.sendText(msg_chat_id,msg_id,'*-اضغط للحصول على بوت الكت*',"md",false, false, false, false, reply_markup)
end
if text == "اهمس" or text == "بوت الهمسه-" or text == "بوت الهمسه" or text == "همسه" or text == "اريد بوت الهمسه" or text == "دزلي بوت الهمسه" or text == "دزولي بوت الهمسه" then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-@FFXX2BOT *',"md",true)  
end
if text == 'رابط الحذف' or text == 'بوت الحذف' or text == 'بوت حذف' or text == 'رابط حذف' then
local tt =[[
-Deletion link in all social media .
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '‹ Delete Bot ›', url = "https://t.me/FFDD5BOT"}},
{{text = '‹ Telegram', url = "https://my.telegram.org/auth?to=delete"},{text = 'Instagram ›', url = "https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/"}},
{{text = '‹ Facebook', url = "https://www.facebook.com/help/deleteaccount"},{text = 'Snapchat ›', url = "https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount"}},
{{text = '‹ TeAm LaRiCa ›', url = "https://t.me/MaLaTHTeam"}}
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/R3J3BOT&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'مبرمج' or text == 'مبرمج السورس' or text == 'مطور السورس' or text == 'المبرمج' then
local tt =[[
-[مبرمج السورس](https://t.me/sSs_sSs) .
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = '‹ مبرمج السورس .', url = "https://t.me/sSs_sSs"}},}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/sSs_sSs&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'السورس' or text == 'سورس' or text == 'يا سورس' or text == 'source' then
photo = "https://t.me/DovePhotoo/5"
local tt =[[
Welcome To Source
-[Source Dove](https://t.me/MaLaTHTeam) .
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '‹ Source Channel ›', url = "https://t.me/MaLaTHTeam"}},
{{text = '‹ Developer', url = "https://t.me/sSs_sSs"},{text = 'Tws Dove ›', url = "https://t.me/sSs_BoT"}},
{{text = '‹ Exp Source ›', url = "https://t.me/filesMaLaTH"}}
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo=https://t.me/MaLaTHTeam&caption=".. URL.escape(tt).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end


if text == 'الاوامر' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = 'اوامر الحمايه', data = msg.sender.user_id..'/help1' }, { text = ' اوامر الادمنيه', data = msg.sender.user_id..'/help2' }, 
 },
{ 
{ text = 'اوامر المدراء', data = msg.sender.user_id..'/help3' }, { text = 'اوامر المنشئين', data = msg.sender.user_id..'/help4' }, 
 },
{ 
{ text = 'اوامر مطورين', data = msg.sender.user_id..'/help5' }, { text = 'العاب البوت', data = msg.sender.user_id..'/help6' }, 
 },
{ 
{ text = 'القفل والفتح', data = msg.sender.user_id..'/NoNextSeting' }, { text = 'التفعيل والتعطيل', data = msg.sender.user_id..'/listallAddorrem' }, 
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id, [[*
-اهلا بك في قائمة الاوامر ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-م1 ↫ اوامر الحمايه
-م2 ↫ اوامر الادمنيه
-م3 ↫ اوامر المدراء
-م4 ↫ اوامر المنشئين
-م5 ↫ اوامر مطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
*]],"md",false, false, false, false, reply_markup)
elseif text == 'مسح الرتب' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(44)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ مسح الاساسين ›', data = msg.sender.user_id..'/TheBasics' },
 },
{ 
{ text = '‹ مسح المنشئين ›', data = msg.sender.user_id..'/Originators' },{ text = '‹ مسح المدراء ›', data = msg.sender.user_id..'/Managers' },
 },
{ 
{ text = '‹ مسح الادمنيه ›', data = msg.sender.user_id..'/Addictive' },{ text = '‹ مسح المميزين ›', data = msg.sender.user_id..'/DelDistinguished' },
 },
{ 
{ text = '‹ MaLaTH Team ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-هلا بك في قسم رتب المجموعة',"md",false, false, false, false, reply_markup)


--LaR --


elseif text == 'عرض الرتب' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(44)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local L = Redis:scard(TheMaLaTH.."MaLaTH:TheBasics:Group"..msg_chat_id) 
local LL = Redis:scard(TheMaLaTH.."MaLaTH:Originators:Group"..msg_chat_id) 
local LLL = Redis:scard(TheMaLaTH.."MaLaTH:Managers:Group"..msg_chat_id)
local LLLL = Redis:scard(TheMaLaTH.."MaLaTH:Addictive:Group"..msg_chat_id)  
local LLLLL = Redis:scard(TheMaLaTH.."MaLaTH:Distinguished:Group"..msg_chat_id)
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ الاساسيين : '..L..' ›', data = msg.sender.user_id..'/TheBasicslar' },
 },
{ 
{ text = '‹ المنشئين : '..LL..' ›', data = msg.sender.user_id..'/Originatorslar' },{ text = '‹ المدراء : '..LLL..' ›', data = msg.sender.user_id..'/Managerslar' },
 },
{ 
{ text = '‹ الادمنيه : '..LLLL..' ›', data = msg.sender.user_id..'/Addictivelar' },{ text = '‹ المميزين : '..LLLLL..' ›', data = msg.sender.user_id..'/DelDistinguishedlar' },
 },
{ 
{ text = '‹ MaLaTH Team ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-هلا بك في قسم رتب المجموعة',"md",false, false, false, false, reply_markup)

--
elseif text == 'مسح رسائلي' or text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local LaR = (Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..msg.chat_id..msg.sender.user_id) or 0)
local lar = (Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) or 0)
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ مسح سحكاتي : '..LaR..' ›', data = msg.sender.user_id..'/MsgDell' },{ text = '‹ مسح رسائلي : '..lar..' ›', data = msg.sender.user_id..'/MMsgDel' },
 },
 { 
{ text = '‹ اخفاء الاوامر ›', data =msg.sender.user_id..'/'.. 'delAmr' }
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-من خلال الازرار يمكنك مسح رسائلك وسحكاتك',"md",false, false, false, false, reply_markup)

elseif text == 'م1' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help1' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م2' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help2' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م3' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help3' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م4' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help4' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م5' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help5' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'الالعاب' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ قائمة الاوامر ›', data = msg.sender.user_id..'/help6' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
end

if text == 'تحديث' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
print('Chat Id : '..msg_chat_id)
print('User Id : '..msg_user_send_id)
LuaTele.sendText(msg_chat_id,msg_id, "-تم تحديث ملفات البوت","md",true)
dofile('MaLaTH.lua')  
end
if text == "تغير اسم البوت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي الاسم الان ","md",true)  
end
if text == "حذف اسم البوت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف اسم البوت ","md",true)   
end
if text == (Redis:get(TheMaLaTH.."MaLaTH:Name:Bot") or "لاريكا") then
local NamesBot = (Redis:get(TheMaLaTH.."MaLaTH:Name:Bot") or "لاريكا")
local NameBots = { 
"عمر "..NamesBot.. " شتريد ؟",
"ها سيد",
"موجود بس لتصيح",
"لتلح دا احجي ويه بنات سالار بعدين اجاوبك",
"راح نموت بكورونا ونته بعدك تصيح "..NamesBot,
'كول سيد'
 }
return LuaTele.sendText(msg_chat_id,msg_id, NameBots[math.random(#NameBots)],"md",true)  
end
if text == "بوت" then
local NamesBot = (Redis:get(TheMaLaTH.."MaLaTH:Name:Bot") or "لاريكا")
local BotName = { 
"باوع لك خليني احبك وصيحلي باسمي "..NamesBot,
"لتخليني ارجع لحركاتي لقديمه وردا ترا اسمي "..NamesBot.. "",
"راح نموت بكورونا ونته بعدك تصيح بوت"
 }
return LuaTele.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md",true)   
end
if text == 'تنظيف المشتركين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(TheMaLaTH..'MaLaTH:Num:User:Pv',v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'*-العدد الكلي ‹ '..#list..' ›\n-تم العثور على ‹ '..x..' › من المشتركين حاظرين البوت*',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*-العدد الكلي ‹ '..#list..' ›\n-لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,TheMaLaTH)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'*-البوت عضو في المجموعة سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(TheMaLaTH..'MaLaTH:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(TheMaLaTH..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
LuaTele.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(TheMaLaTH..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(TheMaLaTH..'MaLaTH:ChekBotAdd',v)
LuaTele.leaveChat(v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'*-العدد الكلي ‹ '..#list..' › للمجموعات \n-تم العثور على ‹ '..x..' › مجموعات البوت ليس ادمن \n-تم تعطيل المجموعة ومغادره البوت من الوهمي *',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*-العدد الكلي ‹ '..#list..' › للمجموعات \n-لا توجد مجموعات وهميه*',"md")
end
end
if text == "سمايلات" or text == "سمايل" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
Random = { "🍏","🍎","🍐","🍊","🍋","🍉","🍇","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","🧀","??","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","⚔","🛡","🔮","🌡","💣","-","📍","📓","📗","📂","📅","📪","📫","-","📭","⏰","📺","🎚","☎️","📡" }
SM = Random[math.random(#Random)]
Redis:set(TheMaLaTH.."MaLaTH:Game:Smile"..msg.chat_id,SM)
return LuaTele.sendText(msg_chat_id,msg_id,"-اسرع واحد يدز هاذا السمايل ? ~ { `"..SM.."` }","md",true)  
end
end
if text == "كت" or text == "كت تويت" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
local texting = { "اخر افلام شاهدتها", 
"اخر افلام شاهدتها", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"اخر كتاب قرآته", 
"ليش حسين ذكي؟ ", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ؟ ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش أخر شي ضيعته؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" آخر مره ضربت عشره كانت متى ؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
"تحب ترتبط بكيرفي ولا فلات؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميلة عندك؟ ", 
" ما أكثر تطبيق تقضي وقتك عليه؟ ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ", 
" قدوتك من الأجيال السابقة؟ ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ", 
"أكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحة النفسية؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" أكثر تغيير ترغب أن تغيّره في نفسك؟ ", 
"أكثر شيء أسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو أفضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفترة الحالية؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صورة احترافية من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا-؟ ", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمة غريبة ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفة إحترام للي إخترع ؟ ", 
"أقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "أكثر جملة أثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "أجمل اسم بنت بحرف الباء؟ ",
  "كيف هي أحوال قلبك؟ ",
  "أجمل مدينة؟ ",
  "كيف كان أسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطة بعمرك؟ ",
  "نسبة النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ ",
  "أغنية عالقة في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاة فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش أفضل بوت برأيك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وقوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجة تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعادة متى تنام؟ ",
  "شيء من صغرك ماتغير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجة تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "‏-هل تعتقد أن هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل ل مشاكل الحياة؟ ",
  "سؤال دايم تتهرب من الاجابة عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبة تقولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقة كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ ",
  "حاط نغمة خاصة لأي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "أفضل أكلة تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "أطول مكالمة كم ساعة؟ ",
  "تحب الحياة الإلكترونية ولا الواقعية؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "أطول مدة نمت فيها كم ساعة؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "أول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الأفلام اللي تحب تتابعه؟ ",
  "أنت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك أخوان او خوات من الرضاعة؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس أنه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية؟ ",
  "اجمل هدية جاتك وش هو؟ ",
  "الصداقة ولا الحب؟ ",
"الصداقة ولا الحب؟ ",
  "الغيرة الزائدة شك؟ ولا فرط الحب؟ ",
    "هل انت دي تويت باعت باندا؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش أخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمقولة اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حالياً؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "أنت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمقولة الصحبة تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "أفضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسية؟ ",
  "تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ ",
  "أفضل ممارسة بالنسبة لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برأيك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي أول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الأغاني؟ ",
  "عندكم شخص مطوع بالعايلة؟ ",
  "تتقبل النصيحة من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوة الصداقة تكون بإيش؟ ",
"أفضل البدايات بالعلاقة ب وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضلة؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "أخر مرة بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "أفضل صفة تحبه بنفسك؟ ",
  "كلمة تقولها للوالدين؟ ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومة ولا تفضفض؟ ",
  "أنت بعلاقة حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "أغلب وقتك تكون وين؟ ",
  "لو المقصود يقرأ وش بتكتب له؟ ",
  "تحب تعبر بالكتابة ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السيارة اللي بتشتريها؟ ",
  "كم أعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
"تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو أمنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت باندا؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانة ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب باندا؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمة للشخص اللي يسب ويسطر؟ ",
  "آية من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ ",
"حاجة ودك تغيرها هالفترة؟ ",
  "كم فلوسك حالياً وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميلة؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك؟ ",
  "ألطف شخص مر عليك بحياتك؟ ",
   "هل باندا لطيف؟ ",
"انت من الناس المؤدبة ولا نص نص؟ ",
  "كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "أكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تقولها؟ ",
  "وش نوع جوالك؟ واذا بتغيره وش بتأخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مرة كذبت؟ ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع أحد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش أفضل لعبته بحياتك؟ ",
  "أخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو أُتيحت لك ؟ ",
   "لي باندا ناك اليكس؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوة وش بيرضيك ؟ ",
  "تنام ب اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا أحد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظة؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت ب مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا ف بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
 } 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == 'بنك' or text == 'البنك' then
LuaTele.sendText(msg.chat_id,msg.id,[[
-مرحبا بك هذه اوامر لعبه البنك 
-━─━─━─━─━─━─━─━-
- انشاء حساب بنكي  ~ تفتح حساب وتقدر تحول فلوس مع مزايا اخره

- مسح حساب بنكي  ~ تلغي حسابك البنكي

- تحويل ~ تطلب رقم حساب الشخص وتحول له فلوس

- حسابي ~ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك

- فلوسي ~ يظهرلك عدد فلوسك

- راتب ~ يعطيك راتب كل ١٠ دقائق

- بخشيش ~ يعطيك بخشيش كل ١٠ دقايق

- تسليب ~ تتسليب فلوس اشخاص كل ١٠ دقايق

- استثمار ~ تستثمر بالمبلغ اللي تريده مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜

- حظ ~ تلعبها بأي مبلغ تكسبه ياتخسره انت وحظك

- مضاربه ~ تضارب بأي مبلغ تريده والنسبة من ٩٠٪؜ الى ٩٠٪؜ انت وحظك

- قرض ~ تاخذ قرض من البنك

- تسديد القرض ~ بتسدد القرض اذا عليك 

- هجوم ~ تهجم عالخصم مع زيادة نسبة كل هجوم

- كنز ~ يعطيك كنز بسعر مختلف انتا وحظك

- توب الفلوس ~ يطلع توب اكثر ناس لديهم فلوس بكل الكروبات

- توب الحراميه ~ يطلع لك اكثر ناس يسلبون

- زواج ~ تكتبه بالرد على رسالة شخص مع المهر ويزوجك

- زواجي ~ يطلع وثيقة زواجك اذا متزوج

- طلاق ~ يطلقك اذا متزوج

- خلع ~ يخلع زوجك ويرجع له المهر

- زواجات ~ يطلع اغلى ٢٠ زواجات

- ترتيبي ~ يطلع ترتيبك باللعبة

- شراء رتبه ~ لكي تشتري رتبه ف المجموعه

]],"md",true)  
return false
end

if text == 'انشاء حساب بنكي' or text == 'انشاء حساب البنكي' or text =='انشاء الحساب بنكي' or text =='انشاء الحساب البنكي' or text == "انشاء حساب" or text == "فتح حساب بنكي" then
cobnum = tonumber(Redis:get("bandid"..msg.sender.user_id))
if cobnum == msg.sender.user_id then
return LuaTele.sendText(msg.chat_id,msg.id, "- حسابك محظور من لعبة البنك","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
creditcc = math.random(5000000000000000,5999999999999999);
creditvi = math.random(4000000000000000,4999999999999999);
creditex = math.random(6000000000000000,6999999999999999);
balas = 50
if Redis:sismember("booob",msg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "- لديك حساب بنكي مسبقاً\n\n- لعرض معلومات حسابك اكتب\n» `حسابي`","md",true)
end
Redis:setex("booobb" .. msg.chat_id .. ":" .. msg.sender.user_id,60, true)
LuaTele.sendText(msg.chat_id,msg.id,[[
- لانشاء حساب قم باختيار نوع البطاقة
ــــــــــــــــــــــــــــــــــــــــــــــــــ
‍-`ماستر`
‍-`فيزا`
‍-`اكسبرس`
ــــــــــــــــــــــــــــــــــــــــــــــــ
-اضغط للنسخ
- مدة الطلب دقيقة واحدة ويطردك الموظف
]],"md",true)  
return false
end
if Redis:get("booobb" .. msg.chat_id .. ":" .. msg.sender.user_id) then
if text == "ماستر" then
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender.user_id
Redis:set("bobna"..msg.sender.user_id,news)
Redis:set("boob"..msg.sender.user_id,balas)
Redis:set("boobb"..msg.sender.user_id,creditcc)
Redis:set("bbobb"..msg.sender.user_id,text)
Redis:set("boballname"..creditcc,news)
Redis:set("boballbalc"..creditcc,balas)
Redis:set("boballcc"..creditcc,creditcc)
Redis:set("boballban"..creditcc,text)
Redis:set("boballid"..creditcc,banid)
Redis:sadd("booob",msg.sender.user_id)
Redis:del("booobb" .. msg.chat_id .. ":" .. msg.sender.user_id) 
LuaTele.sendText(msg.chat_id,msg.id, "\n-تم انشاء حساب في بنك لاريكا 🏦\n-وشحنالك 50 دولار هديه\n\n- رقم حسابك - ( `"..creditcc.."` )\n- نوع البطاقة - ( ماستر 💳 )\n- فلوسك - ( 50 دولار 💰 )  ","md",true)  
end 
if text == "فيزا" then
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender.user_id
Redis:set("bobna"..msg.sender.user_id,news)
Redis:set("boob"..msg.sender.user_id,balas)
Redis:set("boobb"..msg.sender.user_id,creditvi)
Redis:set("bbobb"..msg.sender.user_id,text)
Redis:set("boballname"..creditvi,news)
Redis:set("boballbalc"..creditvi,balas)
Redis:set("boballcc"..creditvi,creditvi)
Redis:set("boballban"..creditvi,text)
Redis:set("boballid"..creditvi,banid)
Redis:sadd("booob",msg.sender.user_id)
Redis:del("booobb" .. msg.chat_id .. ":" .. msg.sender.user_id) 
LuaTele.sendText(msg.chat_id,msg.id, "\n-تم انشاء حساب في بنك لاريكا 🏦\n-وشحنالك 50 دولار هدية\n\n- رقم حسابك - ( `"..creditvi.."` )\n- نوع البطاقة - ( فيزا 💳 )\n- فلوسك - ( 50 دولار 💰 )  ","md",true)   
end 
if text == "اكسبرس" then
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender.user_id
Redis:set("bobna"..msg.sender.user_id,news)
Redis:set("boob"..msg.sender.user_id,balas)
Redis:set("boobb"..msg.sender.user_id,creditex)
Redis:set("bbobb"..msg.sender.user_id,text)
Redis:set("boballname"..creditex,news)
Redis:set("boballbalc"..creditex,balas)
Redis:set("boballcc"..creditex,creditex)
Redis:set("boballban"..creditex,text)
Redis:set("boballid"..creditex,banid)
Redis:sadd("booob",msg.sender.user_id)
Redis:del("booobb" .. msg.chat_id .. ":" .. msg.sender.user_id) 
LuaTele.sendText(msg.chat_id,msg.id, "\n-تم انشاء حساب في بنك لاريكا 🏦\n-وشحنالك 50 دولار هديه\n\n- رقم حسابك - ( `"..creditex.."` )\n- نوع البطاقة - ( اكسبرس 💳 )\n- فلوسك - ( 50 دولار 💰 )  ","md",true)   
end 
end
if text == 'مسح حساب بنكي' or text == 'مسح حساب البنكي' or text =='مسح الحساب بنكي' or text =='مسح الحساب البنكي' or text == "مسح حسابي البنكي" or text == "مسح حسابي بنكي" or text == "مسح حسابي" then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender.user_id) then
Redis:srem("booob", msg.sender.user_id)
Redis:del("boob"..msg.sender.user_id)
Redis:del("boobb"..msg.sender.user_id)
Redis:del("rrfff"..msg.sender.user_id)
Redis:srem("rrfffid", msg.sender.user_id)
Redis:srem("roogg1", msg.sender.user_id)
Redis:srem("roogga1", msg.sender.user_id)
Redis:del("roog1"..msg.sender.user_id)
Redis:del("rooga1"..msg.sender.user_id)
Redis:del("rahr1"..msg.sender.user_id)
Redis:del("rahrr1"..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "- مسحت حسابك البنكي 🏦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تثبيت النتائج' or text == 'تثبيت نتائج' then
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
time = os.date("*t")
month = time.month
day = time.day
local_time = month.."/"..day
local bank_users = Redis:smembers("booob")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يوجد حسابات في البنك","md",true)
end
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get("boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇",
"🥈",
"🥉"
}
for k,v in pairs(mony_list) do
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set("medal"..v[2],convert_mony)
Redis:set("medal2"..v[2],emo)
Redis:set("medal3"..v[2],local_time)
Redis:sadd("medalid",v[2])
Redis:set("medal"..v[2],convert_mony)
Redis:set("medal2"..v[2],emo)
Redis:set("medal3"..v[2],local_time)
Redis:sadd("medalid",v[2])
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')'
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set("medal"..v[2],convert_mony)
Redis:set("medal2"..v[2],emo)
Redis:set("medal3"..v[2],local_time)
Redis:sadd("medalid",v[2])
if num == 4 then
return end
end
LuaTele.sendText(msg.chat_id,msg.id, "- ثبتت النتائج","md",true)
end
end
if text == 'مسح كل الفلوس' or text == 'مسح كل فلوس' then
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
local bank_users = Redis:smembers("booob")
for k,v in pairs(bank_users) do
Redis:del("boob"..v)
Redis:del("kreednum"..v)
Redis:del("kreed"..v)
Redis:del("rrfff"..v)
end
local bank_usersr = Redis:smembers("rrfffid")
for k,v in pairs(bank_usersr) do
Redis:del("boob"..v)
Redis:del("rrfff"..v)
end
LuaTele.sendText(msg.chat_id,msg.id, "- مسحت كل فلوس اللعبة 🏦","md",true)
end
end

if text == 'تصفير النتائج' or text == 'مسح لعبه البنك' then
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
local bank_users = Redis:smembers("booob")
for k,v in pairs(bank_users) do
Redis:del("boob"..v)
Redis:del("kreednum"..v)
Redis:del("kreed"..v)
Redis:del("rrfff"..v)
Redis:del("numattack"..v)
end
local bank_usersr = Redis:smembers("rrfffid")
for k,v in pairs(bank_usersr) do
Redis:del("boob"..v)
Redis:del("rrfff"..v)
end
Redis:del("rrfffid")
Redis:del("booob")
LuaTele.sendText(msg.chat_id,msg.id, "- مسحت لعبه البنك 🏦","md",true)
end
end
if text == 'ميدالياتي' or text == 'ميداليات' then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("medalid",msg.sender.user_id) then
local medaa2 = Redis:get("medal2"..msg.sender.user_id)
if medaa2 == "🥇" then
local medaa = Redis:get("medal"..msg.sender.user_id)
local medaa2 = Redis:get("medal2"..msg.sender.user_id)
local medaa3 = Redis:get("medal3"..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💰\nالمركز : "..medaa2.." كونكر "..medaa2.."","md",true)
elseif medaa2 == "🥈" then
local medaa = Redis:get("medal"..msg.sender.user_id)
local medaa2 = Redis:get("medal2"..msg.sender.user_id)
local medaa3 = Redis:get("medal3"..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💰\nالمركز : "..medaa2.." ايس "..medaa2.."","md",true)
else
local medaa = Redis:get("medal"..msg.sender.user_id)
local medaa2 = Redis:get("medal2"..msg.sender.user_id)
local medaa3 = Redis:get("medal3"..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💰\nالمركز : "..medaa2.." تاج "..medaa2.."","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك ميداليات","md",true)
end
end

if text == 'فلوسي' or text == 'فلوس' and tonumber(msg.reply_to_message_id) == 0 then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender.user_id) then
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
if tonumber(ballancee) < 1 then
return LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك فلوس ارسل الالعاب وابدأ بجمع الفلوس ","md",true)
end
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id, "- فلوسك `"..convert_mony.."` دولار 💰","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'فلوسه' or text == 'فلوس' and tonumber(msg.reply_to_message_id) ~= 0 then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- لا يمتلك حساب بالبنك*","md",true)  
return false
end
if Redis:sismember("booob",Remsg.sender.user_id) then
ballanceed = Redis:get("boob"..Remsg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "- فلوسه `"..convert_mony.."` دولار 💰","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- لا يمتلك حساب بنكي ","md",true)
end
end

if text == 'حسابي' or text == 'حسابي البنكي' or text == 'رقم حسابي' then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember("booob",msg.sender.user_id) then
cccc = Redis:get("boobb"..msg.sender.user_id)
uuuu = Redis:get("bbobb"..msg.sender.user_id)
pppp = Redis:get("rrfff"..msg.sender.user_id) or 0
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id, "- الاسم ↫ "..news.."\n- الحساب ↫ `"..cccc.."`\n- بنك ↫ ( لاريكا )\n- نوع ↫ ( "..uuuu.." )\n- الرصيد ↫ ( "..convert_mony.." دولار 💰 )\n- التسليب ( "..pppp.." دولار 💰 )","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'مسح حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- لا يمتلك حساب بالبنك*","md",true)  
return false
end
local ban = LuaTele.getUser(Remsg.sender.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember("booob",Remsg.sender.user_id) then
ccccc = Redis:get("boobb"..Remsg.sender.user_id)
uuuuu = Redis:get("bbobb"..Remsg.sender.user_id)
ppppp = Redis:get("rrfff"..Remsg.sender.user_id) or 0
ballanceed = Redis:get("boob"..Remsg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
Redis:srem("booob", Remsg.sender.user_id)
Redis:del("boob"..Remsg.sender.user_id)
Redis:del("boobb"..Remsg.sender.user_id)
Redis:del("rrfff"..Remsg.sender.user_id)
Redis:del("numattack"..Remsg.sender.user_id)
Redis:srem("rrfffid", Remsg.sender.user_id)
Redis:srem("roogg1", Remsg.sender.user_id)
Redis:srem("roogga1", Remsg.sender.user_id)
Redis:del("roog1"..Remsg.sender.user_id)
Redis:del("rooga1"..Remsg.sender.user_id)
Redis:del("rahr1"..Remsg.sender.user_id)
Redis:del("rahrr1"..Remsg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "- الاسم ↫ "..news.."\n- الحساب ↫ `"..ccccc.."`\n- بنك ↫ ( لاريكا )\n- نوع ↫ ( "..uuuuu.." )\n- الرصيد ↫ ( "..convert_mony.." دولار 💰 )\n- التسليب - ( "..ppppp.." دولار 💰 )\n- مسكين مسحت حسابه ","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- لا يمتلك حساب بنكي ","md",true)
end
end
end

if text == 'حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- لا يمتلك حساب بالبنك*","md",true)  
return false
end
local ban = LuaTele.getUser(Remsg.sender.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember("booob",Remsg.sender.user_id) then
ccccc = Redis:get("boobb"..Remsg.sender.user_id)
uuuuu = Redis:get("bbobb"..Remsg.sender.user_id)
ppppp = Redis:get("rrfff"..Remsg.sender.user_id) or 0
ballanceed = Redis:get("boob"..Remsg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "- الاسم ↫ "..news.."\n- الحساب ↫ `"..ccccc.."`\n- بنك ↫ ( لاريكا )\n- نوع ↫ ( "..uuuuu.." )\n- الرصيد ↫ ( "..convert_mony.." دولار 💰 )\n- التسليب - ( "..ppppp.." دولار 💰 )","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديه حساب بنكي ","md",true)
end
end

if text and text:match('^مسح حساب (.*)$') or text and text:match('^مسح حسابه (.*)$') then
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
local UserName = text:match('^مسح حساب (.*)$') or text:match('^مسح حسابه (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
local ban = LuaTele.getUser(coniss)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
if Redis:sismember("booob",coniss) then
ccccc = Redis:get("boobb"..coniss)
uuuuu = Redis:get("bbobb"..coniss)
ppppp = Redis:get("rrfff"..coniss) or 0
ballanceed = Redis:get("boob"..coniss) or 0
local convert_mony = string.format("%.0f",ballanceed)
Redis:srem("booob", coniss)
Redis:del("boob"..coniss)
Redis:del("boobb"..coniss)
Redis:del("rrfff"..coniss)
Redis:srem("roogg1", coniss)
Redis:srem("roogga1", coniss)
Redis:del("roog1"..coniss)
Redis:del("rooga1"..coniss)
Redis:del("rahr1"..coniss)
Redis:del("rahrr1"..coniss)
Redis:del("numattack"..coniss)
Redis:srem("rrfffid", coniss)
LuaTele.sendText(msg.chat_id,msg.id, "- الاسم ↫ "..news.."\n- الحساب ↫ `"..ccccc.."`\n- بنك ↫ ( لاريكا )\n- نوع ↫ ( "..uuuuu.." )\n- الرصيد ↫ ( "..convert_mony.." دولار 💰 )\n- التسليب - ( "..ppppp.." دولار 💰 )\n- مسكين مسحت حسابه ","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديه حساب بنكي ","md",true)
end
end
end

if text and text:match('^حساب (.*)$') or text and text:match('^حسابه (.*)$') then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local UserName = text:match('^حساب (.*)$') or text:match('^حسابه (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if Redis:get("boballcc"..coniss) then
local yty = Redis:get("boballname"..coniss)
local bobpkh = Redis:get("boballid"..coniss)
ballancee = Redis:get("boob"..bobpkh) or 0
local convert_mony = string.format("%.0f",ballancee)
local dfhb = Redis:get("boballbalc"..coniss)

local fsvhh = Redis:get("boballban"..coniss)
LuaTele.sendText(msg.chat_id,msg.id, "- الاسم ↫ "..yty.."\n- الحساب ↫ `"..coniss.."`\n- بنك ↫ ( لاريكا )\n- نوع ↫ ( "..fsvhh.." )\n- الرصيد ↫ ( "..convert_mony.." دولار 💰 )","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- لا يوجده حساب بنكي كذا","md",true)
end
end

if text == 'مضاربه' then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:ttl("iiooooo" .. msg.sender.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 15 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 14 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 13 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 12 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 660 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 11 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 1 دقيقة )","md",true)
end
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`مضاربه` المبلغ","md",true)
end

if text and text:match('^مضاربه (.*)$') or text and text:match('^مضاربة (.*)$') then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local UserName = text:match('^مضاربه (.*)$') or text:match('^مضاربة (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if Redis:sismember("booob",msg.sender.user_id) then
if Redis:ttl("iiooooo" .. msg.sender.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 15 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 14 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 13 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 12 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 660 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 11 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("iiooooo" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تضارب الآن\n- تعال بعد ( 1 دقيقة )","md",true)
end
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
if tonumber(coniss) < 99 then
return LuaTele.sendText(msg.chat_id,msg.id, "- الحد الادنى المسموح هو 100 دولار 💰","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسك لا تكفي*","md",true)
end
local modarba = {"1", "2", "3", "4️",}
local Descriptioontt = modarba[math.random(#modarba)]
local modarbaa = math.random(1,90);
if Descriptioontt == "1" or Descriptioontt == "3" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee -ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set("boob"..msg.sender.user_id , math.floor(ballanceekkku))
Redis:setex("iiooooo" .. msg.sender.user_id,900, true)
LuaTele.sendText(msg.chat_id,msg.id, "- مضاربة فاشلة ❎\n- نسبة الخسارة "..modarbaa.."%\n- المبلغ الذي خسرته ( "..convert_mony.." دولار 💰 )\n- فلوسك اصبحت ( "..convert_mony1.." دولار 💰 )","md",true)
elseif Descriptioontt == "2" or Descriptioontt == "4" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee + ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set("boob"..msg.sender.user_id , math.floor(ballanceekkku))
Redis:setex("iiooooo" .. msg.sender.user_id,900, true)
LuaTele.sendText(msg.chat_id,msg.id, "- مضاربة ناجحة ✅\n- نسبة الربح "..modarbaa.."%\n- المبلغ الذي ربحته ( "..convert_mony.." دولار 💰 )\n- فلوسك اصبحت ( "..convert_mony1.." دولار 💰 )","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'استثمار' then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:ttl("iioooo" .. msg.sender.user_id) >= 1180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 20 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 1120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 19 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 1060 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 18 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 1000 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 17 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 940 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 16 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 15 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 14 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 13 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 12 دقيقة )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 640 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 11 دقيقة )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 1 دقيقة )","md",true)
end
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`استثمار` المبلغ","md",true)
end

if text and text:match('^استثمار (.*)$') then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local UserName = text:match('^استثمار (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if Redis:sismember("booob",msg.sender.user_id) then
if Redis:ttl("iioooo" .. msg.sender.user_id) >= 1180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 20 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 1120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 19 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 1060 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 18 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 1000 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 17 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 940 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 16 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 15 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 14 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 13 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 12 دقيقة )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 640 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 11 دقيقة )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("iioooo" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تستثمر الآن\n- تعال بعد ( 1 دقيقة )","md",true)
end
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
if tonumber(coniss) < 99 then
return LuaTele.sendText(msg.chat_id,msg.id, "- الحد الادنى المسموح هو 100 دولار 💰","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسك لا تكفي*","md",true)
end
if tonumber(ballancee) < 100000 then
local hadddd = math.random(10,15);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
local convert_mony = string.format("%.0f",ballanceekk)
local convert_mony1 = string.format("%.0f",ballanceekkk)
Redis:set("boob"..msg.sender.user_id , math.floor(ballanceekkk))
Redis:setex("iioooo" .. msg.sender.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "- استثمار ناجح 💰\n- نسبة الربح - "..hadddd.."%\n- مبلغ الربح - ( "..convert_mony.." دولار 💰 )\n- فلوسك اصبحت - ( "..convert_mony1.." دولار 💰 )","md",true)
else
local hadddd = math.random(1,9);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
local convert_mony = string.format("%.0f",ballanceekk)
local convert_mony1 = string.format("%.0f",ballanceekkk)
Redis:set("boob"..msg.sender.user_id , math.floor(ballanceekkk))
Redis:setex("iioooo" .. msg.sender.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "- استثمار ناجح 💰\n- نسبة الربح - "..hadddd.."%\n- مبلغ الربح - ( "..convert_mony.." دولار 💰 )\n- فلوسك اصبحت - ( "..convert_mony1.." دولار 💰 )","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'حظ' then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:ttl("iiooo" .. msg.sender.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 15 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 14 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 13 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 12 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 640 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 11 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 1 دقيقة )","md",true)
end
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`حظ` المبلغ","md",true)
end

if text and text:match('^حظ (.*)$') then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local UserName = text:match('^حظ (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if Redis:sismember("booob",msg.sender.user_id) then
if Redis:ttl("iiooo" .. msg.sender.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 15 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 14 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 13 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 12 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 640 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 11 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("iiooo" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تلعب لعبة الحظ الآن\n- تعال بعد ( 1 دقيقة )","md",true)
end
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسك لا تكفي*","md",true)
end

local daddd = {"1", "2",}
local haddd = daddd[math.random(#daddd)]
if haddd == "1" then
local ballanceek = ballancee + coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceek)
Redis:set("boob"..msg.sender.user_id , math.floor(ballanceek))
Redis:setex("iiooo" .. msg.sender.user_id,900, true)
LuaTele.sendText(msg.chat_id,msg.id, "- مبروك لقد فزت بالحظ\n- فلوسك قبل - ( "..convert_mony.." دولار 💰 )\n- فلوسك الآن - ( "..convert_mony1.." دولار 💰 ) .","md",true)
else
local ballanceekk = ballancee -coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceekk)
Redis:set("boob"..msg.sender.user_id , math.floor(ballanceekk))
Redis:setex("iiooo" .. msg.sender.user_id,900, true)
LuaTele.sendText(msg.chat_id,msg.id, "- للاسف خسرت بالحظ 👁️\n- فلوسك قبل - ( "..convert_mony.." دولار 💰 )\n- فلوسك الآن - ( "..convert_mony1.." دولار 💰 ) .","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تحويل' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`تحويل` المبلغ","md",true)
end

if text and text:match('^تحويل (.*)$') then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` لكي تستطيع التحويل","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local UserName = text:match('^تحويل (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if not Redis:sismember("booob",msg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ","md",true)
end
if tonumber(coniss) < 100 then
return LuaTele.sendText(msg.chat_id,msg.id, "- الحد الادنى المسموح به هو 100 دولار ","md",true)
end
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
if tonumber(ballancee) < 100 then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسك لا تكفي*","md",true)
end

if tonumber(coniss) > tonumber(ballancee) then
return LuaTele.sendText(msg.chat_id,msg.id, "عذرا فلوسك لا تكفي","md",true)
end

Redis:set("transn"..msg.sender.user_id,coniss)
Redis:setex("trans" .. msg.chat_id .. ":" .. msg.sender.user_id,60, true)
LuaTele.sendText(msg.chat_id,msg.id,[[
- ارسل الآن رقم الحساب البنكي الذي تريد التحويل له

- معاك دقيقة وحدة والغي طلب التحويل .

]],"md",true)  
return false
end
if Redis:get("trans" .. msg.chat_id .. ":" .. msg.sender.user_id) then
cccc = Redis:get("boobb"..msg.sender.user_id)
uuuu = Redis:get("bbobb"..msg.sender.user_id)
if text ~= text:match('^(%d+)$') then
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
Redis:del("transn" .. msg.sender.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"- ارسل رقم حساب بنكي ","md",true)
end
if text == cccc then
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
Redis:del("transn" .. msg.sender.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يمكنك تحول لنفسك ","md",true)
end
if Redis:get("boballcc"..text) then
local UserNamey = Redis:get("transn"..msg.sender.user_id)
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
local fsvhhh = Redis:get("boballid"..text)
local bann = LuaTele.getUser(fsvhhh)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
newss = " لا يوجد "
end
local fsvhh = Redis:get("boballban"..text)
UserNameyr = UserNamey / 10
UserNameyy = UserNamey -UserNameyr
local convert_mony = string.format("%.0f",UserNameyy)
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
deccde = ballancee -UserNamey
Redis:set("boob"..msg.sender.user_id , math.floor(deccde))
-----------
decdecb = Redis:get("boob"..fsvhhh) or 0
deccde2 = decdecb + UserNameyy
Redis:set("boob"..fsvhhh , math.floor(deccde2))

LuaTele.sendText(msg.chat_id,msg.id, "حوالة صادرة من بنك لاريكا\n\nالمرسل : "..news.."\nرقم الحساب : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمستلم : "..newss.."\nرقم الحساب : `"..text.."`\nنوع البطاقة : "..fsvhh.."\nخصمت 10% رسوم تحويل\nالمبلغ : "..convert_mony.." دولار 💰","md",true)
LuaTele.sendText(fsvhhh,0, "حوالة واردة من بنك لاريكا\n\nالمرسل : "..news.."\nرقم الحساب : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمبلغ : "..convert_mony.." دولار 💰","md",true)
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
Redis:del("transn" .. msg.sender.user_id)
else
LuaTele.sendText(msg.chat_id,msg.id, "- لا يوجده حساب بنكي كذا","md",true)
Redis:del("trans" .. msg.chat_id .. ":" .. msg.sender.user_id) 
Redis:del("transn" .. msg.sender.user_id)
end
end


if text == "ترتيبي" then
if Redis:sismember("booob",msg.sender.user_id) then
local bank_users = Redis:smembers("booob")
my_num_in_bank = {}
for k,v in pairs(bank_users) do
local mony = Redis:get("boob"..v)
table.insert(my_num_in_bank, {math.floor(tonumber(mony)) , v})
end
table.sort(my_num_in_bank, function(a, b) return a[1] > b[1] end)
for k,v in pairs(my_num_in_bank) do
if tonumber(v[2]) == tonumber(msg.sender.user_id) then
local mony = v[1]
return LuaTele.sendText(msg.chat_id,msg.id,"- ترتيبك ( "..k.." )","md",true)
end
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == "توب فلوس" or text == "توب الفلوس" then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local bank_users = Redis:smembers("booob")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 25 شخص في بنك لاريكا :\nــــــــــــــــــــــــــــــــــــــــــــــــــ\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get("boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4 ➙",
"5 ➙",
"6 ➙",
"7 ➙",
"8 ➙",
"9 ➙",
"10 ➙",
"11 ➙",
"12 ➙",
"13 ➙",
"14 ➙",
"15 ➙",
"16 ➙",
"17 ➙",
"18 ➙",
"19 ➙",
"20 ➙",
"21 ➙",
"22 ➙",
"23 ➙",
"24 ➙",
"25 ➙"
}
for k,v in pairs(mony_list) do
if num <= 25 then
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
top_mony = top_mony..emo.." "..convert_mony.." || "..user_name.."\n"
end
end
top_monyy = top_mony.."\nــــــــــــــــــــــــــــــــــــــــــــــــــ\n- اي اسم مخالف او غش باللعب راح يتصفر وينحظر اللاعب"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '‹ source MaLaTH ›', url="t.me/MaLaTHTEAM"},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,top_monyy,"html",false, false, false, false, reply_markup)
end

if text == "توب الحراميه" or text == "توب الحرامية" or text == "توب حراميه" or text == "توب التسليب" or text == "توب تسليب" then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local ty_users = Redis:smembers("rrfffid")
if #ty_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"- لا يوجد احد","md",true)
end
ty_anubis = "توب 20 شخص يسلبون فلوس في بنك لاريكا :\nــــــــــــــــــــــــــــــــــــــــــــــــــ\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get("rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4 ➙",
"5 ➙",
"6 ➙",
"7 ➙",
"8 ➙",
"9 ➙",
"10 ➙",
"11 ➙",
"12 ➙",
"13 ➙",
"14 ➙",
"15 ➙",
"16 ➙",
"17 ➙",
"18 ➙",
"19 ➙",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
ty_anubis = ty_anubis..emoo.." "..convert_mony.." || "..user_name.."\n"
end
end
ty_anubiss = ty_anubis.."\nــــــــــــــــــــــــــــــــــــــــــــــــــ\n- اي اسم مخالف او غش باللعب راح يتصفر وينحظر اللاعب"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '‹ source MaLaTH ›', url="t.me/MaLaTHTEAM"},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,ty_anubiss,"md",false, false, false, false, reply_markup)
end

if text == 'تسديد قرضه' and tonumber(msg.reply_to_message_id) ~= 0 then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- لا يمتلك حساب بالبنك*","md",true)  
return false
end
if Redis:sismember("booob",Remsg.sender.user_id) then
if Redis:get("kreed"..msg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "- سدد قرضك اول شي بعدين اعمل راعي النشامى ","md",true)
end
if not Redis:get("kreed"..Remsg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "- ماعليه قرض","md",true)
else
local ban = LuaTele.getUser(Remsg.sender.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..Remsg.sender.user_id))
if tonumber(ballanceed) < tonumber(krses) then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسك لا تكفي*","md",true)
end
nshme = ballanceed -krses
Redis:set("boob"..msg.sender.user_id,math.floor(nshme))
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
Redis:del("kreed"..Remsg.sender.user_id)
Redis:del("kreednum"..Remsg.sender.user_id)
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "- اشعار تسديد قرض عن "..news.."\n\nالقرض : "..krses.." دولار 💰\nتم اقتطاع المبلغ من فلوسك\nفلوسك الآن : "..convert_mony.." دولار 💰 ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديه حساب بنكي ","md",true)
end
end

if text == 'تسديد قرض' or text == 'تسديد القرض' or text == 'تسديد قرضي' and tonumber(msg.reply_to_message_id) == 0 then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender.user_id) then
if not Redis:get("kreed"..msg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "- ماعليك قرض ","md",true)
end
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if tonumber(ballanceed) < tonumber(krses) then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسك لا تكفي*","md",true)
end
tsded = ballanceed -krses
Redis:set("boob"..msg.sender.user_id,math.floor(tsded))
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
Redis:del("kreed"..msg.sender.user_id)
Redis:del("kreednum"..msg.sender.user_id)
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "- اشعار تسديد قرض\n\nالقرض : "..krses.." دولار 💰\nتم اقتطاع المبلغ من فلوسك\nفلوسك الآن : "..convert_mony.." دولار 💰","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'القرض' or text == 'قرض' then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "- سحبت قرض قبل بقيمة "..krses.." دولار 💰","md",true)
end
if Redis:sismember("booob",msg.sender.user_id) then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
if tonumber(ballanceed) < 100000 then
kredd = tonumber(ballanceed) + 900000
Redis:set("boob"..msg.sender.user_id,kredd)
Redis:set("kreednum"..msg.sender.user_id,900000)
Redis:set("kreed"..msg.sender.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "- تم وهو قرض بقيمة 900000 دولار 💰","md",true)
elseif tonumber(ballanceed) < 200000 then
kredd = tonumber(ballanceed) + 800000
Redis:set("boob"..msg.sender.user_id,kredd)
Redis:set("kreednum"..msg.sender.user_id,800000)
Redis:set("kreed"..msg.sender.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "- تم وهو قرض بقيمة 800000 دولار 💰","md",true)
elseif tonumber(ballanceed) < 300000 then
kredd = tonumber(ballanceed) + 700000
Redis:set("boob"..msg.sender.user_id,kredd)
Redis:set("kreednum"..msg.sender.user_id,700000)
Redis:set("kreed"..msg.sender.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "- تم وهو قرض بقيمة 700000 دولار 💰","md",true)
elseif tonumber(ballanceed) < 400000 then
kredd = tonumber(ballanceed) + 600000
Redis:set("boob"..msg.sender.user_id,kredd)
Redis:set("kreednum"..msg.sender.user_id,600000)
Redis:set("kreed"..msg.sender.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "- تم وهو قرض بقيمة 600000 دولار 💰","md",true)
elseif tonumber(ballanceed) < 500000 then
kredd = tonumber(ballanceed) + 500000
Redis:set("boob"..msg.sender.user_id,kredd)
Redis:set("kreednum"..msg.sender.user_id,500000)
Redis:set("kreed"..msg.sender.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "- تم وهو قرض بقيمة 500000 دولار 💰","md",true)
elseif tonumber(ballanceed) < 600000 then
kredd = tonumber(ballanceed) + 400000
Redis:set("boob"..msg.sender.user_id,kredd)
Redis:set("kreednum"..msg.sender.user_id,400000)
Redis:set("kreed"..msg.sender.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "- تم وهو قرض بقيمة 400000 دولار 💰","md",true)
elseif tonumber(ballanceed) < 700000 then
kredd = tonumber(ballanceed) + 300000
Redis:set("boob"..msg.sender.user_id,kredd)
Redis:set("kreednum"..msg.sender.user_id,300000)
Redis:set("kreed"..msg.sender.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "- تم وهو قرض بقيمة 300000 دولار 💰","md",true)
elseif tonumber(ballanceed) < 800000 then
kredd = tonumber(ballanceed) + 200000
Redis:set("boob"..msg.sender.user_id,kredd)
Redis:set("kreednum"..msg.sender.user_id,200000)
Redis:set("kreed"..msg.sender.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "- تم وهو قرض بقيمة 200000 دولار 💰","md",true)
elseif tonumber(ballanceed) < 900000 then
kredd = tonumber(ballanceed) + 100000
Redis:set("boob"..msg.sender.user_id,kredd)
Redis:set("kreednum"..msg.sender.user_id,100000)
Redis:set("kreed"..msg.sender.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "- تم وهو قرض بقيمة 100000 دولار 💰","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- فلوسك فوق المليون مايطلعلك قرض","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'بخشيش' or text == 'بقشيش' then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender.user_id) then
if Redis:ttl("iioo" .. msg.sender.user_id) >=1 then
local hours = Redis:ttl("iioo" .. msg.sender.user_id) / 60
return LuaTele.sendText(msg.chat_id,msg.id,"- اخذت منذ قليل بخشيش استنى "..math.floor(hours).." دقيقة","md",true)
end

local jjjo = math.random(200,1000);
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
bakigcj = ballanceed + jjjo
Redis:set("boob"..msg.sender.user_id , bakigcj)
LuaTele.sendText(msg.chat_id,msg.id,"- دلعتك وعطيتك "..jjjo.." دولار 💰","md",true)
Redis:setex("iioo" .. msg.sender.user_id,600, true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تسليب' and tonumber(msg.reply_to_message_id) == 0 then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`تسليب` بالرد","md",true)
end

if text == 'تسليب' or text == 'يسلبون' or text == 'تسليبه' and tonumber(msg.reply_to_message_id) ~= 0 then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender.user_id) then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- لا يمتلك حساب بالبنك*","md",true)  
return false
end
if Remsg.sender.user_id == msg.sender.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- بدك تتسليب نفسك 🤡*","md",true)  
return false
end
if Redis:ttl("polic" .. msg.sender.user_id) >= 280 then
return LuaTele.sendText(msg.chat_id,msg.id,"- انتا بالسجن 🏤 استنى ( 5 دقائق )","md",true)
elseif Redis:ttl("polic" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- انتا بالسجن 🏤 استنى ( 4 دقائق )","md",true)
elseif Redis:ttl("polic" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- انتا بالسجن 🏤 استنى ( 3 دقائق )","md",true)
elseif Redis:ttl("polic" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- انتا بالسجن 🏤 استنى ( 2 دقيقة )","md",true)
elseif Redis:ttl("polic" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- انتا بالسجن 🏤 استنى ( 1 دقيقة )","md",true)
end
if Redis:ttl("hrame" .. Remsg.sender.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 15 دقيقة )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 14 دقيقة )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 13 دقيقة )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 12 دقيقة )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 640 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 11 دقيقة )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("hrame" .. Remsg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- ذا المسكين مزروف قبل شوي\n- يمديك تتسليبه بعد ( 1 دقيقة )","md",true)
end
if Redis:sismember("booob",Remsg.sender.user_id) then
ballanceed = Redis:get("boob"..Remsg.sender.user_id) or 0
if tonumber(ballanceed) < 199 then
return LuaTele.sendText(msg.chat_id,msg.id, "- لا يمكنك تتسليبه فلوسه اقل من 200 دولار 💰","md",true)
end
local hrame = math.floor(math.random() * 200) + 1;
local hramee = math.floor(math.random() * 5) + 1;
if hramee == 1 or hramee == 2 or hramee == 3 or hramee == 4 then
local ballanceed = Redis:get("boob"..Remsg.sender.user_id) or 0
local ballancope = Redis:get("boob"..msg.sender.user_id) or 0
zrfne = ballanceed -hrame
zrfnee = ballancope + hrame
Redis:set("boob"..msg.sender.user_id , math.floor(zrfnee))
Redis:set("boob"..Remsg.sender.user_id , math.floor(zrfne))
Redis:setex("hrame" .. Remsg.sender.user_id,900, true)
local zoropeo = Redis:get("rrfff"..msg.sender.user_id) or 0
zoroprod = zoropeo + hrame
Redis:set("rrfff"..msg.sender.user_id,zoroprod)
Redis:sadd("rrfffid",msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "- خذ يالحرامي تسليبته "..hrame.." دولار 💰","md",true)
else
Redis:setex("polic" .. msg.sender.user_id,300, true)
LuaTele.sendText(msg.chat_id,msg.id, "- مسكتك الشرطة وانتا تتسليب 🚔","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديه حساب بنكي ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'راتب' or text == 'راتبي' then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender.user_id) then
if Redis:ttl("iiioo" .. msg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("iiioo" .. msg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("iiioo" .. msg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("iiioo" .. msg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("iiioo" .. msg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("iiioo" .. msg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("iiioo" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("iiioo" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("iiioo" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("iiioo" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- راتبك بينزل بعد ( 1 دقيقة )","md",true)
end

local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
if Descriptioont == "1" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 دولار 💰\nوظيفتك : كابتن كريم 🚙\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "2" then
local ratpep = ballancee + 3500
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 دولار 💰\nوظيفتك : شرطي 👮🏻‍♂️\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "3" then
local ratpep = ballancee + 3500
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 دولار 💰\nوظيفتك : بياع حبوب 🍻\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "4" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 دولار 💰\nوظيفتك : سواق تاكسي 🚕\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "5" then
local ratpep = ballancee + 5000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 دولار 💰\nوظيفتك : قاضي 👨\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "6" then
local ratpep = ballancee + 2500
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2500 دولار 💰\nوظيفتك : نوم 🛌\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "7" then
local ratpep = ballancee + 2700
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2700 دولار 💰\nوظيفتك : مغني 🎤\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "8" then
local ratpep = ballancee + 2900
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2900 دولار 💰\nوظيفتك : كوفيره 💆\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "9" then
local ratpep = ballancee + 2500
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2500 دولار 💰\nوظيفتك : ربة منزل 🤷\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "10" then
local ratpep = ballancee + 2900
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2900 دولار 💰\nوظيفتك : مربيه اطفال 💁\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "11" then
local ratpep = ballancee + 3700
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3700 دولار 💰\nوظيفتك : كهربائي 💡\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "12" then
local ratpep = ballancee + 3600
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3600 دولار 💰\nوظيفتك : نجار ⛏\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "13" then
local ratpep = ballancee + 2400
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2400 دولار 💰\nوظيفتك : متذوق طعام 🍕\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "14" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 دولار 💰\nوظيفتك : فلاح 👨\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "15" then
local ratpep = ballancee + 5000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 دولار 💰\nوظيفتك : كاشير بنده 🙋\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "16" then
local ratpep = ballancee + 6000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 دولار 💰\nوظيفتك : ممرض 👨\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "17" then
local ratpep = ballancee + 3100
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3100 دولار 💰\nوظيفتك : مهرج 🤹\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "18" then
local ratpep = ballancee + 3300
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3300 دولار 💰\nوظيفتك : عامل توصيل 🚴\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "19" then
local ratpep = ballancee + 4800
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4800 دولار 💰\nوظيفتك : عسكري 👮\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "20" then
local ratpep = ballancee + 6000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 دولار 💰\nوظيفتك : مهندس 👨\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "21" then
local ratpep = ballancee + 8000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 8000 دولار 💰\nوظيفتك : وزير 👨\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "22" then
local ratpep = ballancee + 5500
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5500 دولار 💰\nوظيفتك : محامي ⚖️\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "23" then
local ratpep = ballancee + 5500
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5500 دولار 💰\nوظيفتك : تاجر 💰\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "24" then
local ratpep = ballancee + 7000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7000 دولار 💰\nوظيفتك : دكتور 👨\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "25" then
local ratpep = ballancee + 2600
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2600 دولار 💰\nوظيفتك : حفار قبور ⚓\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "26" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 دولار 💰\nوظيفتك : حلاق ✂\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "27" then
local ratpep = ballancee + 5000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 دولار 💰\nوظيفتك : إمام مسجد 📿\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "28" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 دولار 💰\nوظيفتك : صياد 🎣\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "29" then
local ratpep = ballancee + 2300
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2300 دولار 💰\nوظيفتك : خياط 🧵\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "30" then
local ratpep = ballancee + 7100
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7100 دولار 💰\nوظيفتك : طيار 🛩\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "31" then
local ratpep = ballancee + 5300
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5300 دولار 💰\nوظيفتك : مودل 🕴\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "32" then
local ratpep = ballancee + 10000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 10000 دولار 💰\nوظيفتك : ملك 👑\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "33" then
local ratpep = ballancee + 2700
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2700 دولار 💰\nوظيفتك : سباك 🔧\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "34" then
local ratpep = ballancee + 3900
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3900 دولار 💰\nوظيفتك : موزع 🗺\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "35" then
local ratpep = ballancee + 4100
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4100 دولار 💰\nوظيفتك : سكيورتي 👮\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "36" then
local ratpep = ballancee + 3500
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 دولار 💰\nوظيفتك : معلم شاورما 🌯\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "37" then
local ratpep = ballancee + 6700
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6700 دولار 💰\nوظيفتك : دكتور ولاده 👨\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "38" then
local ratpep = ballancee + 6600
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6600 دولار 💰\nوظيفتك : مذيع 🗣\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "39" then
local ratpep = ballancee + 3400
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3400 دولار 💰\nوظيفتك : عامل مساج 💆\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "40" then
local ratpep = ballancee + 6300
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6300 دولار 💰\nوظيفتك : ممثل 🤵\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "41" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 دولار 💰\nوظيفتك : جزار 🥩\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "42" then
local ratpep = ballancee + 7000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7000 دولار 💰\nوظيفتك : مدير بنك 💳\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "43" then
local ratpep = ballancee + 6000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 دولار 💰\nوظيفتك : مبرمج 👨\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "44" then
local ratpep = ballancee + 5000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 دولار 💰\nوظيفتك : رقاصه 💃\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "45" then
local ratpep = ballancee + 4900
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4900 دولار 💰\nوظيفتك : 👩🏼‍💻 صحفي\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "46" then
local ratpep = ballancee + 5300
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5300 دولار 💰\nوظيفتك : 🥷 حرامي\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "47" then
local ratpep = ballancee + 6000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 دولار 💰\nوظيفتك : 🔮 ساحر\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "48" then
local ratpep = ballancee + 6500
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6500 دولار 💰\nوظيفتك : ⚽ لاعب️\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "49" then
local ratpep = ballancee + 4000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4000 دولار 💰\nوظيفتك : 🖼 مصور\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "50" then
local ratpep = ballancee + 3000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 دولار 💰\nوظيفتك : ☎️ عامل مقسم\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "51" then
local ratpep = ballancee + 3200
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3200 دولار 💰\nوظيفتك : 📖 كاتب\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
elseif Descriptioont == "52" then
local ratpep = ballancee + 4000
Redis:set("boob"..msg.sender.user_id , math.floor(ratpep))
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4000 دولار 💰\nوظيفتك : 🧪 مخبري\nنوع العملية : اضافة راتب\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("iiioo" .. msg.sender.user_id,600, true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'هجوم' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`هجوم` المبلغ ( بالرد )","md",true)
end
if text and text:match("^هجوم (%d+)$") and msg.reply_to_message_id == 0 then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`هجوم` المبلغ ( بالرد )","md",true)
end

if text and text:match('^هجوم (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^هجوم (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender.user_id) then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- لا يمتلك حساب بالبنك*","md",true)  
return false
end
if Remsg.sender.user_id == msg.sender.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- تهاجم نفسك 🤡*","md",true)  
return false
end
if Redis:ttl("attack" .. msg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 10 دقائق )","md",true)
elseif Redis:ttl("attack" .. msg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 9 دقائق )","md",true)
elseif Redis:ttl("attack" .. msg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 8 دقائق )","md",true)
elseif Redis:ttl("attack" .. msg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 7 دقائق )","md",true)
elseif Redis:ttl("attack" .. msg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 6 دقائق )","md",true)
elseif Redis:ttl("attack" .. msg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 5 دقائق )","md",true)
elseif Redis:ttl("attack" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 4 دقائق )","md",true)
elseif Redis:ttl("attack" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 3 دقائق )","md",true)
elseif Redis:ttl("attack" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 2 دقيقة )","md",true)
elseif Redis:ttl("attack" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- خسرت بأخر معركة استنى ( 1 دقيقة )","md",true)
end
if Redis:ttl("defen" .. Remsg.sender.user_id) >= 1780 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 30 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1740 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 29 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1680 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 28 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1620 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 27 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1560 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 26 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1500 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 25 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1440 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 24 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1380 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 23 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1320 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 22 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1260 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 21 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1200 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 20 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1140 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 19 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1080 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 18 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 1020 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 17 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 960 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 16 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 900 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 15 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 840 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 14 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 780 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 13 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 720 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 12 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 660 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 11 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 600 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("defen" .. Remsg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- الخصم خسر بأخر معركة\n- يمديك تهاجمه بعد ( 1 دقيقة )","md",true)
end
if Redis:sismember("booob",Remsg.sender.user_id) then
ballancope = Redis:get("boob"..msg.sender.user_id) or 0
ballanceed = Redis:get("boob"..Remsg.sender.user_id) or 0
if tonumber(ballancope) < 100000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- لا يمكنك تهجم فلوسك اقل من 100000 دولار 💰","md",true)
end
if tonumber(ballanceed) < 100000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- لا يمكنك تهجم عليه فلوسه اقل من 100000 دولار 💰","md",true)
end
if tonumber(coniss) < 9999 then
return LuaTele.sendText(msg.chat_id,msg.id, "- الحد الادنى المسموح هو 10000 دولار 💰","md",true)
end
if tonumber(ballancope) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسك لا تكفي*","md",true)
end
if tonumber(ballanceed) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسه لا تكفي*","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local bann = LuaTele.getUser(Remsg.sender.user_id)
if bann.first_name then
neewss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
neewss = " لا يوجد "
end
if Descriptioont == "1" or Descriptioont == "3" then
local ballanceed = Redis:get("boob"..Remsg.sender.user_id) or 0
local ballancope = Redis:get("boob"..msg.sender.user_id) or 0
zrfne = ballancope -coniss
zrfnee = ballanceed + coniss
Redis:set("boob"..msg.sender.user_id , math.floor(zrfne))
Redis:set("boob"..Remsg.sender.user_id , math.floor(zrfnee))
Redis:setex("attack" .. msg.sender.user_id,600, true)
local convert_mony = string.format("%.0f",coniss)
LuaTele.sendText(msg.chat_id,msg.id, "- لقد خسرت في المعركة "..neews.." 🛡\nالفائز : "..neewss.."\nالخاسر : "..neews.."\nالجائزة : "..convert_mony.." دولار 💰","md",true)
elseif Descriptioont == "2" or Descriptioont == "4" or Descriptioont == "5" or  Descriptioont == "6" or Descriptioont == "8" then
local ballanceed = Redis:get("boob"..Remsg.sender.user_id) or 0
local ballancope = Redis:get("boob"..msg.sender.user_id) or 0
begaatt = Redis:get("numattack"..msg.sender.user_id) or 1000
numattackk = tonumber(begaatt) -1
if numattackk == 0 then
numattackk = 1
end
attack = coniss / numattackk
zrfne = ballancope + math.floor(attack)
zrfnee = ballanceed -math.floor(attack)
Redis:set("boob"..msg.sender.user_id , math.floor(zrfne))
Redis:set("boob"..Remsg.sender.user_id , math.floor(zrfnee))
Redis:setex("defen" .. Remsg.sender.user_id,1800, true)
Redis:set("numattack"..msg.sender.user_id , math.floor(numattackk))
local convert_mony = string.format("%.0f",math.floor(attack))
LuaTele.sendText(msg.chat_id,msg.id, "- لقد فزت في المعركة\nودمرت قلعة "..neewss.." 🏰\nالفائز : "..neews.."\nالخاسر : "..neewss.."\nالجائزة : "..convert_mony.." دولار 💰\nنسبة قوة المهاجم اصبحت "..numattackk.." 🩸","md",true)
elseif Descriptioont == "7" then
local ballanceed = Redis:get("boob"..Remsg.sender.user_id) or 0
local ballancope = Redis:get("boob"..msg.sender.user_id) or 0
halfzrf = coniss / 2
zrfne = ballancope -halfzrf
zrfnee = ballanceed + halfzrf
Redis:set("boob"..msg.sender.user_id , math.floor(zrfne))
Redis:set("boob"..Remsg.sender.user_id , math.floor(zrfnee))
Redis:setex("attack" .. msg.sender.user_id,600, true)
local convert_mony = string.format("%.0f",math.floor(halfzrf))
LuaTele.sendText(msg.chat_id,msg.id, "- لقد خسرت في المعركة "..neews.." .\nولكن استطعت اعادة نصف الموارد\nالفائز : "..neewss.."\nالخاسر : "..neews.."\nالجائزة : "..convert_mony.." دولار 💰","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديه حساب بنكي ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مسح لعبه الزواج' then
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
local zwag_users = Redis:smembers("roogg1")
for k,v in pairs(zwag_users) do
Redis:del("roog1"..v)
Redis:del("rooga1"..v)
Redis:del("rahr1"..v)
Redis:del("rahrr1"..v)
Redis:del("roogte1"..v)
end
local zwaga_users = Redis:smembers("roogga1")
for k,v in pairs(zwaga_users) do
Redis:del("roog1"..v)
Redis:del("rooga1"..v)
Redis:del("rahr1"..v)
Redis:del("rahrr1"..v)
Redis:del("roogte1"..v)
end
Redis:del("roogga1")
Redis:del("roogg1")
LuaTele.sendText(msg.chat_id,msg.id, "- مسحت لعبه الزواج","md",true)
end
end
if text == 'زواج' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زواج` المهر","md",true)
end
if text and text:match("^زواج (%d+)$") and msg.reply_to_message_id == 0 then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زواج` المهر ( بالرد )","md",true)
end
if text and text:match("^زواج (.*)$") and msg.reply_to_message_id ~= 0 then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local UserName = text:match('^زواج (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if msg.sender.user_id == Remsg.sender.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- زوجتك نفسي 😂❤️*","md",true)  
return false
end
if tonumber(coniss) < 10000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- الحد الادنى المسموح به هو 10000 دولار ","md",true)
end
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
if tonumber(ballancee) < 10000 then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسك لا تكفي*","md",true)
end
if tonumber(coniss) > tonumber(ballancee) then
return LuaTele.sendText(msg.chat_id,msg.id, "عذرا فلوسك لا تكفي","md",true)
end
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- ليست للزواج*","md",true)  
return false
end
if Redis:get("roog1"..msg.sender.user_id) then
LuaTele.sendText(msg.chat_id,msg.id, "- انت متزوج سابقا !","md",true)
return false
end
if Redis:get("rooga1"..msg.sender.user_id) then
LuaTele.sendText(msg.chat_id,msg.id, "- انت متزوج سابقا !","md",true)
return false
end
if Redis:get("roog1"..Remsg.sender.user_id) then
LuaTele.sendText(msg.chat_id,msg.id, "- هذا الشخص متزوج|متزوجه","md",true)
return false
end
if Redis:get("rooga1"..Remsg.sender.user_id) then
LuaTele.sendText(msg.chat_id,msg.id, "- هذا الشخص متزوج|متزوجه","md",true)
return false
end
local bandd = LuaTele.getUser(msg.sender.user_id)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(Remsg.sender.user_id)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
if Redis:sismember("booob",msg.sender.user_id) then
local hadddd = tonumber(coniss)
ballanceekk = tonumber(coniss) / 100 * 15
ballanceekkk = tonumber(coniss) -ballanceekk
local convert_mony = string.format("%.0f",ballanceekkk)
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
ballanceea = Redis:get("boob"..Remsg.sender.user_id) or 0
zogtea = ballanceea + ballanceekkk
zeugh = ballancee -tonumber(coniss)
Redis:set("boob"..msg.sender.user_id , math.floor(zeugh))
Redis:set("boob"..Remsg.sender.user_id , math.floor(zogtea))
Redis:sadd("roogg1",msg.sender.user_id)
Redis:sadd("roogga1",Remsg.sender.user_id)
Redis:set("roog1"..msg.sender.user_id,msg.sender.user_id)
Redis:set("rooga1"..msg.sender.user_id,Remsg.sender.user_id)
Redis:set("roogte1"..Remsg.sender.user_id,Remsg.sender.user_id)
Redis:set("rahr1"..msg.sender.user_id,tonumber(coniss))
Redis:set("rahr1"..Remsg.sender.user_id,tonumber(coniss))

Redis:set("roog1"..Remsg.sender.user_id,msg.sender.user_id)
Redis:set("rahrr1"..msg.sender.user_id,math.floor(ballanceekkk))

Redis:set("rooga1"..Remsg.sender.user_id,Remsg.sender.user_id)
Redis:set("rahrr1"..Remsg.sender.user_id,math.floor(ballanceekkk))

LuaTele.sendText(msg.chat_id,msg.id, "- زواجا مبارك\nالزوج "..neews.."\nالزوجة "..newws.." \nالمهر : "..convert_mony.." دولار بعد الضريبة 15%\nعشان تشوفون وثيقة زواجكم اكتبوا : *زواجي*","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == "زواجات غش" then
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
  local zwag_users = Redis:smembers("roogg1")
  if #zwag_users == 0 then
  return LuaTele.sendText(msg.chat_id,msg.id,"- لا يوجد زواجات حاليا","md",true)
  end
  top_zwag = "توب 20 اغلى زواجات :\n\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get("rahr1"..v)
  local zwga = Redis:get("rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4 ➙",
"5 ➙",
"6 ➙",
"7 ➙",
"8 ➙",
"9 ➙",
"10 ➙",
"11 ➙",
"12 ➙",
"13 ➙",
"14 ➙",
"15 ➙",
"16 ➙",
"17 ➙",
"18 ➙",
"19 ➙",
"20 ➙"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 20 then
  local zwg_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
  local zwg_tag = '['..zwg_name..'](tg://user?id='..v[2]..')'
  local zwga_name = LuaTele.getUser(v[3]).first_name or Redis:get(v[3].."first_name:") or "لا يوجد اسم"
  local zwga_tag = '['..zwg_name..'](tg://user?id='..v[3]..')'
  local mahr = v[1]
  local convert_mony = string.format("%.0f",mahr)
  local emo = zwag_emoji[k]
  znum = znum + 1
  top_zwag = top_zwag..emo.." "..convert_mony.." || "..zwg_tag.." 👫 "..zwga_tag.."\n"
  end
  end
  local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '‹ source MaLaTH ›', url="t.me/MaLaTHTEAM"},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,top_zwag,"md",false, false, false, false, reply_markup)
  end
  end

if text == "توب زواج" or text == "توب متزوجات" or text == "توب زوجات" or text == "توب زواجات" or text == "زواجات" or text == "الزواجات" then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
  local zwag_users = Redis:smembers("roogg1")
  if #zwag_users == 0 then
  return LuaTele.sendText(msg.chat_id,msg.id,"- لا يوجد زواجات حاليا","md",true)
  end
  top_zwag = "توب 20 اغلى زواجات :\n\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get("rahr1"..v)
  local zwga = Redis:get("rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4 ➙",
"5 ➙",
"6 ➙",
"7 ➙",
"8 ➙",
"9 ➙",
"10 ➙",
"11 ➙",
"12 ➙",
"13 ➙",
"14 ➙",
"15 ➙",
"16 ➙",
"17 ➙",
"18 ➙",
"19 ➙",
"20 ➙"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 20 then
  local zwg_name = LuaTele.getUser(v[2]).first_name or Redis:get(v[2].."first_name:") or "لا يوجد اسم"
  local zwga_name = LuaTele.getUser(v[3]).first_name or Redis:get(v[3].."first_name:") or "لا يوجد اسم"
  local mahr = v[1]
  local convert_mony = string.format("%.0f",mahr)
  local emo = zwag_emoji[k]
  znum = znum + 1
  top_zwag = top_zwag..emo.." "..convert_mony.." || "..zwg_name.." 👫 "..zwga_name.."\n"
  end
  end
  local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '‹ source MaLaTH ›', url="t.me/MaLaTHTEAM"},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,top_zwag,"md",false, false, false, false, reply_markup)
  end

if text == 'زواجي' then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("roogg1",msg.sender.user_id) or Redis:sismember("roogga1",msg.sender.user_id) then
local zoog = Redis:get("roog1"..msg.sender.user_id)
local zooga = Redis:get("rooga1"..msg.sender.user_id)
local mahr = Redis:get("rahr1"..msg.sender.user_id)
local convert_mony = string.format("%.0f",mahr)
local bandd = LuaTele.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
LuaTele.sendText(msg.chat_id,msg.id, "وثيقة الزواج الخاصه بك :\nالزوج "..neews.."\nالزوجة "..newws.."\nالمهر : "..convert_mony.." دولار 💰","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "*- انت اعزب*","md",true)
end
end

if text == 'زوجها' or text == "زوجته" or text == "جوزها" or text == "زوجتو" or text == "زواجه" and msg.reply_to_message_id ~= 0 then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if msg.sender.user_id == Remsg.sender.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- لا تكشف نفسك وتخسر فلوس عالفاضي\n اكتب `زواجي`*","md",true)  
return false
end
if Redis:sismember("roogg1",Remsg.sender.user_id) or Redis:sismember("roogga1",Remsg.sender.user_id) then
if Redis:sismember("booob",msg.sender.user_id) then
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
if tonumber(ballancee) < 100 then
return LuaTele.sendText(msg.chat_id,msg.id, "*- عذرا فلوسك لا تكفي*","md",true)
end
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*- لا يوجد*","md",true)  
return false
end
local zoog = Redis:get("roog1"..Remsg.sender.user_id)
local zooga = Redis:get("rooga1"..Remsg.sender.user_id)
local mahr = Redis:get("rahr1"..Remsg.sender.user_id)
local bandd = LuaTele.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
local otheka = ballancee -100
local convert_mony = string.format("%.0f",mahr)
Redis:set("boob"..msg.sender.user_id , math.floor(otheka))
LuaTele.sendText(msg.chat_id,msg.id, "وثيقة الزواج :\nالزوج "..neews.."\nالزوجة "..newws.."\nالمهر : "..convert_mony.." دولار 💰","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- مسكين اعزب مو متزوج","md",true)
end
end

if text == 'طلاق' then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("roogg1",msg.sender.user_id) or Redis:sismember("roogga1",msg.sender.user_id) then
local zoog = Redis:get("roog1"..msg.sender.user_id)
local zooga = tonumber(Redis:get("rooga1"..msg.sender.user_id))
if tonumber(zoog) == msg.sender.user_id then
local bandd = LuaTele.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end

Redis:srem("roogg1", msg.sender.user_id)
Redis:srem("roogga1", msg.sender.user_id)
Redis:del("roog1"..msg.sender.user_id)
Redis:del("rooga1"..msg.sender.user_id)
Redis:del("rahr1"..msg.sender.user_id)
Redis:del("rahrr1"..msg.sender.user_id)

Redis:srem("roogg1", zooga)
Redis:srem("roogga1", zooga)
Redis:del("roog1"..zooga)
Redis:del("rooga1"..zooga)
Redis:del("rahr1"..zooga)
Redis:del("rahrr1"..zooga)
return LuaTele.sendText(msg.chat_id,msg.id, "- تم طلقتك من زوجتك "..newws.."","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- الطلاق للزوج فقط","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- انت اعزب","md",true)
end
end

if text == 'خلع' then
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("roogg1",msg.sender.user_id) or Redis:sismember("roogga1",msg.sender.user_id) then
local zoog = Redis:get("roog1"..msg.sender.user_id)
local zooga = Redis:get("rooga1"..msg.sender.user_id)
if tonumber(zooga) == msg.sender.user_id then
local mahrr = Redis:get("rahrr1"..msg.sender.user_id)
local bandd = LuaTele.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = LuaTele.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end

ballancee = Redis:get("boob"..zoog) or 0
kalea = ballancee + mahrr
Redis:set("boob"..zoog , kalea)
local convert_mony = string.format("%.0f",mahrr)
LuaTele.sendText(msg.chat_id,msg.id, "- خلعت زوجك "..neews.."\n- ورجعت له المهر ( "..convert_mony.." دولار 💰 )","md",true)

Redis:srem("roogg1", zoog)
Redis:srem("roogga1", zoog)
Redis:del("roog1"..zoog)
Redis:del("rooga1"..zoog)
Redis:del("rahr1"..zoog)
Redis:del("rahrr1"..zoog)

Redis:srem("roogg1", msg.sender.user_id)
Redis:srem("roogga1", msg.sender.user_id)
Redis:del("roog1"..msg.sender.user_id)
Redis:del("rooga1"..msg.sender.user_id)
Redis:del("rahr1"..msg.sender.user_id)
Redis:del("rahrr1"..msg.sender.user_id)
else
LuaTele.sendText(msg.chat_id,msg.id, "- الخلع للزوجات فقط","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- انت اعزب","md",true)
end
end
-------------------------------
if text == 'كنز' then
ballanceed = Redis:get("boob"..msg.sender.user_id) or 0
krses = tonumber(Redis:get("kreednum"..msg.sender.user_id))
if Redis:get("kreed"..msg.sender.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "- عليك قرض بقيمة "..krses.." دولار 💰 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local F_Name = LuaTele.getUser(msg.sender.user_id).first_name
Redis:set(msg.sender.user_id.."first_name:", F_Name)
if Redis:sismember("booob",msg.sender.user_id) then
if Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1780 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 30 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1720 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 29 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1660 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 28 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1600 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 27 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 26 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 25 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 24 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 23 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 22 دقيقة )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 21 دقيقة )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 20 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 19 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1060 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 18 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 1000 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 17 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 940 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 16 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 15 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 14 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 13 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 12 دقيقة )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 640 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 11 دقيقة )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 10 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 9 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 8 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 7 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 6 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 5 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 4 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 3 دقائق )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl("yiioooo" .. msg.sender.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"- فرصة ايجاد كنز آخر بعد ( 1 دقيقة )","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22","23",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
if Descriptioont == "1" then
local knez = ballancee + 40000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : قطعة اثرية 🗳\nسعره : 40000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "2" then
local knez = ballancee + 35000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : حجر الماسي 💎\nسعره : 35000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "3" then
local knez = ballancee + 10000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : لباس قديم 🥻\nسعره : 10000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "4" then
local knez = ballancee + 23000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : عصى سحرية 🪄\nسعره : 23000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "5" then
local knez = ballancee + 8000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جوال نوكيا 📱\nسعره : 8000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "6" then
local knez = ballancee + 27000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : صدف 🏝\nسعره : 27000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "7" then
local knez = ballancee + 18000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : ابريق صدئ ⚗️\nسعره : 18000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "8" then
local knez = ballancee + 100000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : قناع فرعوني 🗿\nسعره : 100000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "9" then
local knez = ballancee + 50000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جرة ذهب 💰\nسعره : 50000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "10" then
local knez = ballancee + 36000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : مصباح فضي 🔦\nسعره : 36000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "11" then
local knez = ballancee + 29000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : لوحة نحاسية 🌇\nسعره : 29000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "12" then
local knez = ballancee + 1000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جوارب قديمة 🧦\nسعره : 1000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "13" then
local knez = ballancee + 16000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : اناء فخاري ⚱️\nسعره : 16000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "14" then
local knez = ballancee + 12000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : خوذة محارب 🪖\nسعره : 12000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "15" then
local knez = ballancee + 19000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : سيف جدي مرزوق 🗡\nسعره : 19000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "16" then
local knez = ballancee + 14000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : مكنسة جدتي رقية 🧹\nسعره : 14000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "17" then
local knez = ballancee + 26000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : فأس ارطغرل 🪓\nسعره : 26000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "18" then
local knez = ballancee + 22000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : بندقية 🔫\nسعره : 22000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "19" then
local knez = ballancee + 11000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : كبريت ناري 🪔\nسعره : 11000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "20" then
local knez = ballancee + 33000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : فرو ثعلب 🦊\nسعره : 33000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "21" then
local knez = ballancee + 40000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جلد تمساح 🐊\nسعره : 40000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "22" then
local knez = ballancee + 17000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : باقة ورود 💐\nسعره : 17000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioont == "23" then
local Textinggtt = {"1", "2",}
local Descriptioontt = Textinggtt[math.random(#Textinggtt)]
if Descriptioontt == "1" then
local knez = ballancee + 17000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : باقة ورود 💐\nسعره : 17000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioontt == "2" then
local Textinggttt = {"1", "2",}
local Descriptioonttt = Textinggttt[math.random(#Textinggttt)]
if Descriptioonttt == "1" then
local knez = ballancee + 40000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جلد تمساح 🐊\nسعره : 40000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
elseif Descriptioonttt == "2" then
local knez = ballancee + 10000000
Redis:set("boob"..msg.sender.user_id , knez)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : حقيبة محاسب البنك 💼\nسعره : 10000000 دولار 💰\nرصيدك الآن : "..convert_mony.." دولار 💰","md",true)
Redis:setex("yiioooo" .. msg.sender.user_id,1800, true)
end
end
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^حظر حساب (.*)$') then
local UserName = text:match('^حظر حساب (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
Redis:set("bandid"..coniss,coniss)
LuaTele.sendText(msg.chat_id,msg.id, "- تم حظر الحساب "..coniss.." من لعبة البنك","md",true)
end
end

if text and text:match('^الغاء حظر حساب (.*)$') then
local UserName = text:match('^الغاء حظر حساب (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
Redis:del("bandid"..coniss)
LuaTele.sendText(msg.chat_id,msg.id, "- تم الغاء حظر الحساب "..coniss.." من لعبة البنك","md",true)
end
end

if text and text:match('^انشاء كوبون (.*)$') then
local UserName = text:match('^انشاء كوبون (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if tonumber(msg.sender.user_id) == tonumber(Sudo_Id) then
numcobo = math.random(1000000000000,9999999999999);
Redis:set("cobonum"..numcobo,numcobo)
Redis:set("cobon"..numcobo,coniss)
LuaTele.sendText(msg.chat_id,msg.id, "- وصل كوبون \n\nالمبلغ : "..coniss.." دولار 💰\nرقم الكوبون : `"..numcobo.."`\n\n- طريقة استخدام الكوبون :\nتكتب ( كوبون + رقمه )\nمثال : كوبون 4593875","md",true)
end
end

if text == "كوبون" or text == "الكوبون" then
LuaTele.sendText(msg.chat_id,msg.id, "- طريقة استخدام الكوبون :\nتكتب ( كوبون + رقمه )\nمثال : كوبون 4593875\n\n-ملاحظة : الكوبون يستخدم لمرة واحدة ولشخص واحد","md",true)
end

if text and text:match('^كوبون (.*)$') then
local UserName = text:match('^كوبون (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = coniss:gsub('-','')
local coniss = tonumber(coniss)
if Redis:sismember("booob",msg.sender.user_id) then
cobnum = Redis:get("cobonum"..coniss)
if coniss == tonumber(cobnum) then
cobblc = Redis:get("cobon"..coniss)
ballancee = Redis:get("boob"..msg.sender.user_id) or 0
cobonplus = ballancee + cobblc
Redis:set("boob"..msg.sender.user_id , cobonplus)
local ballancee = Redis:get("boob"..msg.sender.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:del("cobon"..coniss)
Redis:del("cobonum"..coniss)
LuaTele.sendText(msg.chat_id,msg.id, "- وصل كوبون \n\nالمبلغ : "..cobblc.." دولار 💰\nرقم الكوبون : `"..coniss.."`\nفلوسك الآن : "..convert_mony.." دولار 💰","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "- لا يوجد كوبون بهذا الرقم `"..coniss.."`.","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "- ليس لديك حساب بنكي ","md",true)
end
end

-----------------------> By Java
if text and Redis:get(MaLaTH..msg.chat_id..msg.sender.user_id.."txtrtb") then
    local balance = Redis:get("boob"..msg.sender.user_id)
    if text == 'مميز' and tonumber(balance)  >= 25000 then
    Redis:decrby("boob"..msg.sender.user_id , 25000)
    Redis:sadd(MaLaTH.."Special:Group"..msg_chat_id,msg.sender.user_id) 
    Redis:del(MaLaTH..msg.chat_id..msg.sender.user_id.."txtrtb") 
    return send(msg.chat_id,msg.id,"- تم رفعك مميز بنجاح وخصم 25,000 دولار من فلوسك")
    elseif text == "ادمن" and tonumber(balance)  >= 30000 then
    Redis:decrby("boob"..msg.sender.user_id , 30000)
    Redis:sadd(MaLaTH.."Admin:Group"..msg_chat_id,msg.sender.user_id) 
    Redis:del(MaLaTH..msg.chat_id..msg.sender.user_id.."txtrtb") 
    return send(msg.chat_id,msg.id,"- تم رفعك ادمن بنجاح وخصم 30,000 دولار من فلوسك")
    elseif text == "مدير" and tonumber(balance)  >= 35000 then
    Redis:decrby("boob"..msg.sender.user_id , 35000)
    Redis:sadd(MaLaTH.."Manger:Group"..msg_chat_id,msg.sender.user_id) 
    Redis:del(MaLaTH..msg.chat_id..msg.sender.user_id.."txtrtb") 
    return send(msg.chat_id,msg.id,"- تم رفعك مدير بنجاح وخصم 35,000 دولار من فلوسك")
    elseif text == "منشئ" and tonumber(balance)  >= 40000 then 
    Redis:decrby("boob"..msg.sender.user_id , 40000)
    Redis:sadd(MaLaTH.."Creator:Group"..msg_chat_id,msg.sender.user_id) 
    Redis:del(MaLaTH..msg.chat_id..msg.sender.user_id.."txtrtb") 
    return send(msg.chat_id,msg.id,"- تم رفعك منشئ بنجاح وخصم 40,000 دولار من فلوسك")
    end
    end
    if text == "متجر الرتب" or text == "شراء رتبه" then
    if not Redis:sismember("booob",msg.sender.user_id) then
    return send(msg.chat_id,msg.id,"- ليس لديك حساب بنكي \n- ارسل انشاء حساب بنكي","md")
    end
    local balance = Redis:get("boob"..msg.sender.user_id)
    if tonumber(balance) == tonumber(0) then
    return send(msg.chat_id,msg.id,"- ليس لديك اي فلوس تشتري بيها")
    end
    if tonumber(balance) < 25000 then
    return send(msg.chat_id,msg.id,"- فلوسك لا تكفي لشراء اي رتبه")
    end
    if tonumber(balance)  >= 25000 and tonumber(balance) < 30000 then
    Txtrtb = "- الرتب اللتي يمكنك شرائها هي \nــــــــــــــــــــــــــــــــــــــــــــــــــ\n- `مميز` (25000 دولار) \nــــــــــــــــــــــــــــــــــــــــــــــــــ\n - اضغط علي الرتبه ليتم نسخها"
    elseif tonumber(balance) >= 30000 and tonumber(balance) < 35000 then
    Txtrtb = "- الرتب اللتي يمكنك شرائها هي \nــــــــــــــــــــــــــــــــــــــــــــــــــ\n- `مميز` (25000 دولار)\n- `ادمن` (30000 دولار) \nــــــــــــــــــــــــــــــــــــــــــــــــــ\n- اضغط علي الرتبه ليتم نسخها"
    elseif tonumber(balance) >= 35000 and tonumber(balance) < 40000 then
    Txtrtb = "- الرتب اللتي يمكنك شرائها هي \nــــــــــــــــــــــــــــــــــــــــــــــــــ\n- `مميز` (25000 دولار)\n- `ادمن` (30000 دولار) \n- `مدير` (35000 دولار)\n\n- اضغط علي الرتبه ليتم نسخها"
    elseif tonumber(balance) >= 40000 then
    Txtrtb = "- الرتب اللتي يمكنك شرائها هي \nــــــــــــــــــــــــــــــــــــــــــــــــــ\n- `مميز` (25000 دولار)\n- `ادمن` (30000 دولار) \n- `مدير` (35000 دولار)\n- `منشئ` (40000 دولار)\nــــــــــــــــــــــــــــــــــــــــــــــــــ\n- اضغط علي الرتبه ليتم نسخها"
    end
    Redis:setex(MaLaTH..msg.chat_id..msg.sender.user_id.."txtrtb",180,true)
    return send(msg.chat_id,msg.id,Txtrtb,"md")
    end
if text == "ثنائي اليوم" then
local Info_Members = LuaTele.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members); 
local NumRand2 = math.random(1, #List_Members); 
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = LuaTele.getUser(user1)
local UserInfoo = LuaTele.getUser(user2)
local listTow = "- ثنائي اليوم : \n ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..") ~ ["..UserInfoo.first_name.."](tg://user?id="..UserInfoo.id..")\n√"
return send(msg.chat_id,msg.id,listTow,"md",true)  
end


if text then
local GetMsg = Redis:incr(MaLaTH..'Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) 
Redis:hset(MaLaTH..':GroupUserCountMsg:'..msg.chat_id,msg.sender.user_id,GetMsg)
local UserInfo = LuaTele.getUser(msg.sender.user_id) 
if (UserInfo.first_name) then
NameLUser =(UserInfo.first_name)
else
NameLUser = (UserInfo.first_name)
end
NameLUser = NameLUser
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
Redis:hset(MaLaTH..':GroupNameUser:'..msg.chat_id,msg.sender.user_id,NameLUser)
end

if text == "ترند" or text == "المتفاعلين" then
GroupAllRtba = Redis:hgetall(MaLaTH..':GroupUserCountMsg:'..msg.chat_id)
GetAllNames  = Redis:hgetall(MaLaTH..':GroupNameUser:'..msg.chat_id)
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do table.insert(GroupAllRtbaL,{v,k}) end
Count,Kount,i = 8 , 0 , 1
for _ in pairs(GroupAllRtbaL) do Kount = Kount + 1 end
table.sort(GroupAllRtbaL, function(a, b) return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then Count = Kount end
Text = "- الاشخاص الاكثر تفاعل:\nــــــــــــــــــــــــــــــــــــــــــــــــــ\n"
for k,v in ipairs(GroupAllRtbaL) do
if i <= Count then  Text = Text..i.." ـ ["..(GetAllNames[v[2]] or "خطأ بالأسـم").."](tg://user?id="..v[2]..") ــ (*"..v[1].."*)  \n" end ; i=i+1
end
return send(msg.chat_id,msg.id,Text,"md")
end
if text == "صور" or text == "لعبه الصور" then
if Redis:get(MaLaTH.."Status:Games"..msg.chat_id) then
KlamSpeed = {"مغناطيس","عسل","غوريلا","توت","يويو","ماسنجر","بوصله","لبن","مرسيدس","مدفع","سبونج بوب","قوقع","كنبه","توم","دبوس","اوسكار","تنين","قلم","عبس صلاح","ويجز","ثور","دراجه","قلب","طباشير","نانسي عجرم","نسر","جرس","شوكه","نعناع","بنكرياس","اناناس"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(MaLaTH.."mshaher"..msg.chat_id,name)
name = string.gsub(name,"مغناطيس","https://t.me/awargold/4")
name = string.gsub(name,"عسل","https://t.me/Exp_java/37")
name = string.gsub(name,"لبن","https://t.me/awargold/16")
name = string.gsub(name,"مدفع","https://t.me/awargold/18")
name = string.gsub(name,"مريسيدس","https://t.me/awargold/19")
name = string.gsub(name,"ماسنجر","https://t.me/Exp_java/71")
name = string.gsub(name,"غوريلا","https://t.me/Exp_java/39")
name = string.gsub(name,"بوصله","https://t.me/awargold/15")
name = string.gsub(name,"توت","https://t.me/Exp_java/41")
name = string.gsub(name,"ميزان","https://t.me/Exp_java/42")
name = string.gsub(name,"يويو","https://t.me/awargold/6")
name = string.gsub(name,"كنبه","https://t.me/Exp_java/65")
name = string.gsub(name,"قوقع","https://t.me/Exp_java/44")
name = string.gsub(name,"توم","https://t.me/Exp_java/70")
name = string.gsub(name,"دبوس","https://t.me/awargold/7")
name = string.gsub(name,"اوسكار","https://t.me/awargold/12")
name = string.gsub(name,"سبونج بوب","https://t.me/Exp_java/47")
name = string.gsub(name,"عبس صلاح","https://t.me/Exp_java/69")
name = string.gsub(name,"قلم","https://t.me/awargold/10")
name = string.gsub(name,"ويجز","https://t.me/HC6HH/16")
name = string.gsub(name,"ثور","https://t.me/Exp_java/67")
name = string.gsub(name,"تنين","https://t.me/awargold/11")
name = string.gsub(name,"قلب","https://t.me/Exp_java/60")
name = string.gsub(name,"طباشير","https://t.me/awargold/9")
name = string.gsub(name,"نانسي عجرم","https://t.me/HC6HH/22")
name = string.gsub(name,"نسر","https://t.me/awargold/8")
name = string.gsub(name,"جرس","https://t.me/awargold/2")
name = string.gsub(name,"شوكه","https://t.me/awargold/3")
name = string.gsub(name,"نعناع","https://t.me/Exp_java/56")
name = string.gsub(name,"اناناس","https://t.me/Exp_java/61")
name = string.gsub(name,"دراجه","https://t.me/Exp_java/58")
name = string.gsub(name,"بنكرياس","https://t.me/Exp_java/62")
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo="..name.."&caption="..URL.escape("ما اسم الشئ اللي بالصوره؟").."&reply_to_message_id="..(msg.id/2097152/0.5))
--return LuaTele.sendText(msg_chat_id,msg_id,"- اسرع واحد يرتبها ~ {"..name.."}","md",true)  
end
end

if text == "الاسرع" or tect == "ترتيب" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
KlamSpeed = { "سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر" };
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(TheMaLaTH.."MaLaTH:Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return LuaTele.sendText(msg_chat_id,msg_id,"-اسرع واحد يرتبها ~ { "..name.." }","md",true)  
end
end
if text == "حزوره" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
Hzora = { "الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم" };
name = Hzora[math.random(#Hzora)]
Redis:set(TheMaLaTH.."MaLaTH:Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
return LuaTele.sendText(msg_chat_id,msg_id,"-اسرع واحد يحل الحزوره ↓\n { "..name.." }","md",true)  
end
end
if text == "معاني" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
Redis:del(TheMaLaTH.."MaLaTH:Set:Maany"..msg.chat_id)
Maany_Rand = { "قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان" }
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(TheMaLaTH.."MaLaTH:Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return LuaTele.sendText(msg_chat_id,msg_id,"-اسرع واحد يدز معنى السمايل ~ { "..name.." }","md",true)  
end
end
if text == "العكس" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
Redis:del(TheMaLaTH.."MaLaTH:Set:Aks"..msg.chat_id)
katu = { "باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","شريف","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ" }
name = katu[math.random(#katu)]
Redis:set(TheMaLaTH.."MaLaTH:Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"شريف","كواد")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
return LuaTele.sendText(msg_chat_id,msg_id,"-اسرع واحد يدز العكس ~ { "..name.." }","md",true)  
end
end
if text == "بات" or text == "محيبس" then   
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then 
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '👊', data = '/Mahibes1' }, { text = '👊🏻', data = '/Mahibes2' }, 
 },
{ 
{ text = '👊🏼', data = '/Mahibes3' }, { text = '👊🏽', data = '/Mahibes4' }, 
 },
{ 
{ text = '👊🏾', data = '/Mahibes5' }, { text = '👊🏿', data = '/Mahibes6' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id, [[*
-لعبه المحيبس هي لعبة الحظ 
-جرب حظك ويه البوت واتونس 
-كل ما عليك هوا الضغط على احدى العضمات في الازرار
*]],"md",false, false, false, false, reply_markup)
end
end
if text == "خمن" or text == "تخمين" then   
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
Num = math.random(1,20)
Redis:set(TheMaLaTH.."MaLaTH:Game:Estimate"..msg.chat_id..msg.sender.user_id,Num)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n-اهلا بك عزيزي في لعبة التخمين :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n".."-ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n".."-سيتم تخمين عدد ما بين ال { 1 و 20 } اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ","md",true)  
end
end
if text == "المختلف" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
mktlf = { "😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","👨‍🔧","🧚‍♀","??‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅", };
name = mktlf[math.random(#mktlf)]
Redis:set(TheMaLaTH.."MaLaTH:Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍??👩‍‍💻👩‍‍??👩‍‍💻👨‍💻??‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳??‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
return LuaTele.sendText(msg_chat_id,msg_id,"-اسرع واحد يدز الاختلاف ~ { "..name.." }","md",true)  
end
end
if text == "امثله" then
if Redis:get(TheMaLaTH.."MaLaTH:Status:Games"..msg.chat_id) then
mthal = { "جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله", };
name = mthal[math.random(#mthal)]
Redis:set(TheMaLaTH.."MaLaTH:Game:Example"..msg.chat_id,name)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
return LuaTele.sendText(msg_chat_id,msg_id,"-اسرع واحد يكمل المثل ~ { "..name.." }","md",true)  
end
end
if text and text:match("^بيع مجوهراتي (%d+)$") then
local NumGame = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NumGame) == tonumber(0) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*-لا استطيع البيع اقل من 1 *","md",true)  
end
local NumberGame = Redis:get(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id)
if tonumber(NumberGame) == tonumber(0) then
return LuaTele.sendText(msg_chat_id,msg_id,"-ليس لديك جواهر من الالعاب \n-اذا كنت تريد ربح الجواهر \n-ارسل الالعاب وابدأ اللعب ! ","md",true)  
end
if tonumber(NumGame) > tonumber(NumberGame) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-ليس لديك جواهر بهاذا العدد \n-لزيادة مجوهراتك في اللعبه \n-ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (NumGame * 50)
Redis:decrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id,NumGame)  
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Message:User"..msg.chat_id..":"..msg.sender.user_id,NumGame)  
return LuaTele.sendText(msg_chat_id,msg_id,"-تم خصم *~ { "..NumGame.." }* من مجوهراتك \n-وتم اضافة* ~ { "..(NumGame * 50).." } رساله الى رسالك *","md",true)  
end 
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..Message_Reply.sender.user_id, text:match("^اضف مجوهرات (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم اضافه له { "..text:match("^اضف مجوهرات (%d+)$").." } من المجوهرات").Reply,"md",true)  
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(7)..' ›* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n-عذراً لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Message:User"..msg.chat_id..":"..Message_Reply.sender.user_id, text:match("^اضف رسائل (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"-تم اضافه له { "..text:match("^اضف رسائل (%d+)$").." } من الرسائل").Reply,"md",true)  
end
if text == "مجوهراتي" then 
local Num = Redis:get(TheMaLaTH.."MaLaTH:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
if Num == 0 then 
return LuaTele.sendText(msg_chat_id,msg_id, "-لم تفز بأي مجوهره ","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id, "-عدد الجواهر التي ربحتها *↫ "..Num.." *","md",true)  
end
end

if text == 'ترتيب الاوامر' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(6)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تنزيل الكل')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','ردود المدير')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'سح','مسح سحكاتي')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','مسح رسائلي')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'حذ','حذف رد')
Redis:set(TheMaLaTH.."MaLaTH:Get:Reides:Commands:Group"..msg_chat_id..":"..'#','مسح قائمه العام')

return LuaTele.sendText(msg_chat_id,msg_id,[[*
-تم ترتيب الاوامر بالشكل التالي ↫ ⤈
-ايدي -ا .
-الرابط -ر .
-غنيلي -غ .
-رفع مميز -م .
-اضف رد -رد .
-رفع ادمن -اد .
-حذف رد -حذ .
-رفع مدير -مد .
-رفع منشى -من .
-تنزيل الكل -تك .
-ردود المدير -رر .
-رفع مطور -مط .
-مسح رسائلي -رس .
-مسح المكتومين -،، .
-مسح قائمة العام -# .
-مسح سحكاتي -سح .
-رفع مطور ثانوي -ثانوي .
-رفع منشئ الاساسي -اس .
-تفعيل الايدي بالصوره -تفع .
-تعطيل الايدي بالصوره -تعط .
*]],"md")
end

end --GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == 'تحديث الملفات-' or text == 'تحديث' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
print('Chat Id : '..msg_chat_id)
print('User Id : '..msg_user_send_id)
LuaTele.sendText(msg_chat_id,msg_id, "-تم تحديث ملفات البوت","md",true)
dofile('MaLaTH.lua')  
end
if text == '/start' then
Redis:sadd(TheMaLaTH..'MaLaTH:Num:User:Pv',msg.sender.user_id)  
if not msg.ControllerBot then
if not Redis:get(TheMaLaTH.."MaLaTH:Start:Bot") then
local CmdStart = '*\n-اهلاً بك في بوت '..(Redis:get(TheMaLaTH.."MaLaTH:Name:Bot") or "لاريكا")..
'\n-اختصاص البوت حماية المجموعات'..
'\n-لتفعيل البوت عليك اتباع مايلي ...'..
'\n-اضف البوت الى مجموعتك'..
'\n-ارفع البوت ادمن ‹ مشرف ›'..
'\n-ارسل كلمة ‹ تفعيل › ليتم تفعيل المجموعة*'
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ المطور ›', url = "t.me/"..UserSudo.."" }, 
 },
{ 
{ text = 'قناة السورس ›', url = 't.me/MaLaTHTeam' },{ text = '‹ لتنصيب بوت', url = 't.me/sSs_sSs' }, 
 },
{ 
{ text = '‹ اضفني الى مجموعتك ›', url = 't.me/'..UserBot..'?startgroup=new' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,CmdStart,"md",false, false, false, false, reply_markup)
else
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ المطور ›', url = "t.me/"..UserSudo.."" }, 
 },
{ 
{ text = 'قناة السورس ›', url = 't.me/MaLaTHTeam' },{ text = '‹ لتنصيب بوت', url = 't.me/sSs_sSs' },
 },
{ 
{ text = '‹ اضفني الى مجموعتك ›', url = 't.me/'..UserBot..'?startgroup=new' }, 
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,Redis:get(TheMaLaTH.."MaLaTH:Start:Bot"),"md",false, false, false, false, reply_markup)
end
else
local reply_markup = LuaTele.replyMarkup{ type = 'keyboard',resize = true,is_personal = true,
data = { 
{ 
{ text = 'تفعيل التواصل-',type = 'text' },{ text = 'تعطيل التواصل-', type = 'text' },
 },
{ 
{ text = 'تفعيل البوت الخدمي-',type = 'text' },{ text = 'تعطيل البوت الخدمي-', type = 'text' },
 },
{ 
{ text = 'اذاعه للمجموعات-',type = 'text' },{ text = 'اذاعه خاص-', type = 'text' },
 },
{ 
{ text = 'اذاعه بالتوجيه-',type = 'text' },{ text = 'اذاعه بالتوجيه خاص-', type = 'text' },
 },
{ 
{ text = 'اذاعه بالتثبيت-',type = 'text' },
 },
{ 
{ text = 'المطورين الثانويين-',type = 'text' },{ text = 'المطورين-',type = 'text' },{ text = 'قائمه العام-', type = 'text' },
 },
{ 
{ text = 'مسح المطورين الثانويين-',type = 'text' },{ text = 'مسح المطورين-',type = 'text' },{ text = 'مسح قائمه العام-', type = 'text' },
 },
{ 
{ text = 'تغيير اسم البوت-',type = 'text' },{ text = 'حذف اسم البوت-', type = 'text' },
 },
{ 
{ text = 'الاشتراك الاجباري-',type = 'text' },{ text = 'تغيير الاشتراك الاجباري-',type = 'text' },
 },
{ 
{ text = 'تفعيل الاشتراك الاجباري-',type = 'text' },{ text = 'تعطيل الاشتراك الاجباري-',type = 'text' },
 },
{ 
{ text = 'تغيير المطور الاساسي-',type = 'text' },
 },
{ 
{ text = 'تغير كليشه المطور-',type = 'text' },{ text = 'حذف كليشه المطور-', type = 'text' },
 },
{ 
{ text = 'تغيير كليشه ستارت-',type = 'text' },{ text = 'حذف كليشه ستارت-', type = 'text' },
 },
{ 
{ text = 'الاحصائيات-',type = 'text' },
},
{
{ text = 'تنظيف المجموعات-',type = 'text' },{ text = 'تنظيف المشتركين-', type = 'text' },
 },
{ 
{ text = 'جلب النسخه الاحتياطيه-',type = 'text' },
 },
{ 
{ text = 'اضف رد عام-',type = 'text' },{ text = 'حذف رد عام-', type = 'text' },
 },
{ 
{ text = 'الردود العامه-',type = 'text' },{ text = 'مسح الردود العامه-', type = 'text' },
 },
{ 
{ text = 'تحديث الملفات-',type = 'text' },{ text = 'تحديث السورس-', type = 'text' },
 },
{ 
{ text = 'الغاء الامر-',type = 'text' },
 },
 }
 }
return LuaTele.sendText(msg_chat_id,msg_id,'-اهلا بك عزيزي المطور ', 'md', false, false, false, false, reply_markup)
end
end

if text == 'تنظيف المشتركين-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(TheMaLaTH..'MaLaTH:Num:User:Pv',v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'*-العدد الكلي ‹ '..#list..' ›\n-تم العثور على ‹ '..x..' › من المشتركين حاظرين البوت*',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*-العدد الكلي ‹ '..#list..' ›\n-لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,TheMaLaTH)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'*-البوت عضو في المجموعة سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(TheMaLaTH..'MaLaTH:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(TheMaLaTH..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
LuaTele.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(TheMaLaTH..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(TheMaLaTH..'MaLaTH:ChekBotAdd',v)
LuaTele.leaveChat(v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'*-العدد الكلي ‹ '..#list..' › للمجموعات \n-تم العثور على ‹ '..x..' › مجموعات البوت ليس ادمن \n-تم تعطيل المجموعة ومغادره البوت من الوهمي *',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*-العدد الكلي ‹ '..#list..' › للمجموعات \n-لا توجد مجموعات وهميه*',"md")
end
end
if text == 'تغيير كليشه ستارت-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Change:Start:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي كليشه Start الان ","md",true)  
end
if text == 'حذف كليشه ستارت-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Start:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف كليشه Start ","md",true)   
end
if text == 'تغيير اسم البوت-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي الاسم الان ","md",true)  
end
if text == 'حذف اسم البوت-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف اسم البوت ","md",true)   
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼?? 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH..'MaLaTH:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'*-تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,'*-عدد احصائيات البوت الكامله \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n-عدد المجموعات : '..(Redis:scard(TheMaLaTH..'MaLaTH:ChekBotAdd') or 0)..'\n-عدد المشتركين : '..(Redis:scard(TheMaLaTH..'MaLaTH:Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تغير كليشه المطور-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH..'MaLaTH:GetTexting:DevTheMaLaTH'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,'-ارسل لي الكليشه الان')
end
if text == 'حذف كليشه المطور-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH..'MaLaTH:Texting:DevTheMaLaTH')
return LuaTele.sendText(msg_chat_id,msg_id,'-تم حذف كليشه المطور')
end
if text == 'اضف رد عام-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الان الكلمه لاضافتها في ردود المطور ","md",true)  
end
if text == 'حذف رد عام-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"-ارسل الان الكلمه لحذفها من ردود المطور","md",true)  
end
if text=='اذاعه خاص-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل لي سواء كان 
‹ ملف-ملصق-متحركه-صوره
-فيديو-بصمه الفيديو-بصمه-صوت-رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=='اذاعه للمجموعات-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل لي سواء كان 
‹ ملف-ملصق-متحركه-صوره
-فيديو-بصمه الفيديو-بصمه-صوت-رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت-" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
-ارسل لي سواء كان 
‹ ملف-ملصق-متحركه-صوره
-فيديو-بصمه الفيديو-بصمه-صوت-رساله ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه-" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي التوجيه الان\n-ليتم نشره في المجموعات","md",true)  
return false
end

if text=='اذاعه بالتوجيه خاص-' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheMaLaTH.."MaLaTH:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"-ارسل لي التوجيه الان\n-ليتم نشره الى المشتركين","md",true)  
return false
end

if text == ("الردود العامه-") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:List:Rd:Sudo")
text = "\n-قائمة ردود المطور \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:File"..v) then
db = "ملف 📁"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." -‹ "..v.." › ↫ ‹ "..db.." ›\n"
end
if #list == 0 then
text = "-عذراً لا توجد ردود للمطور"
end
return LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == ("مسح الردود العامه-") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheMaLaTH.."MaLaTH:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Gif"..v)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:vico"..v)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:stekr"..v)     
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Text"..v)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Photo"..v)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Video"..v)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:File"..v)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Audio"..v)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:video_note"..v)
Redis:del(TheMaLaTH.."MaLaTH:List:Rd:Sudo")
end
return LuaTele.sendText(msg_chat_id,msg_id,"-تم حذف ردود المطور","md",true)  
end
if text == 'مسح المطورين-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مطورين حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true)
end
if text == 'مسح المطورين الثانويين-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مطورين حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المطورين *","md",true)
end
if text == 'مسح قائمه العام-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد محظورين عام حالياً , ","md",true)  
end
Redis:del(TheMaLaTH.."MaLaTH:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*-تم مسح ‹ "..#Info_Members.." › من المحظورين عام *","md",true)
end
if text == 'تعطيل البوت الخدمي-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل البوت الخدمي ","md",true)
end
if text == 'تعطيل التواصل-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheMaLaTH.."MaLaTH:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تعطيل التواصل داخل البوت ","md",true)
end
if text == 'تفعيل البوت الخدمي-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل البوت الخدمي ","md",true)
end
if text == 'تفعيل التواصل-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheMaLaTH.."MaLaTH:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"-تم تفعيل التواصل داخل البوت ","md",true)
end
if text == 'قائمه العام-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end 
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد محظورين عام حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه المحظورين عام  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
var(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المحظورين عام ›', data = msg.sender.user_id..'/BanAll' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مطورين حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه مطورين البوت \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المطورين ›', data = msg.sender.user_id..'/Developers' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين الثانويين-' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*-هاذا الامر يخص ‹ '..Controller_Num(1)..' ›* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ 𝖢𝖨𝗂𝖼𝖪 𝖧𝖾𝗋𝖾 ›', url = 't.me/'..Redis:get(TheMaLaTH..'MaLaTH:Channel:Join') }, }, } }
return LuaTele.sendText(msg.chat_id,msg.id,'*\n-عذراً لاتستطيع استخدام البوت !\n-عليك الاشتراك في القناة اولاً :*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"-لا يوجد مطورين حالياً , ","md",true)  
end
ListMembers = '\n*-قائمه مطورين البوت \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { { { text = '‹ مسح المطورين ›', data = msg.sender.user_id..'/Developers' }, }, } }
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if not msg.ControllerBot then
if Redis:get(TheMaLaTH.."MaLaTH:TwaslBot") and not Redis:sismember(TheMaLaTH.."MaLaTH:BaN:In:Tuasl",msg.sender.user_id) then
local ListGet = { Sudo_Id,msg.sender.user_id }
local IdSudo = LuaTele.getChat(ListGet[1]).id
local IdUser = LuaTele.getChat(ListGet[2]).id
local FedMsg = LuaTele.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(TheMaLaTH.."MaLaTH:Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.luatele == "messageSticker" then
LuaTele.sendText(IdSudo,0,Reply_Status(IdUser,'-قام بارسال الملصق').Reply,"md",true)  
end
return LuaTele.sendText(IdUser,msg_id,Reply_Status(IdUser,'-تم ارسال رسالتك الى المطور').Reply,"md",true)  
end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = LuaTele.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(TheMaLaTH.."MaLaTH:Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(TheMaLaTH..'MaLaTH:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'-تم حظره من تواصل البوت ').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(TheMaLaTH..'MaLaTH:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'-تم الغاء حظره من تواصل البوت ').Reply,"md",true)  
end 
local ChatAction = LuaTele.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'-قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  
end
if msg.content.video_note then
LuaTele.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
LuaTele.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
LuaTele.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
LuaTele.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
LuaTele.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
LuaTele.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
LuaTele.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
LuaTele.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
LuaTele.sendText(Info_User,0,text,"md",true)
end 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'-تم ارسال رسالتك اليه ').Reply,"md",true)  
end
end
end 
end --UserBot
end --File_Bot_Run


function CallBackLua(data) ---هذا الكالباك بي الابديت
--var(data) 
if data and data.luatele and data.luatele == "updateSupergroup" then
local Get_Chat = LuaTele.getChat('-100'..data.supergroup.id)
if data.supergroup.status.luatele == "chatMemberStatusBanned" then
Redis:srem(TheMaLaTH.."MaLaTH:ChekBotAdd",'-100'..data.supergroup.id)
local keys = Redis:keys(TheMaLaTH..'*'..'-100'..data.supergroup.id)
for i = 1, #keys do
Redis:del(keys[i])
end
return LuaTele.sendText(Sudo_Id,0,'*\n-تم طرد البوت من مجموعة جديده \n-اسم المجموعة : '..Get_Chat.title..'\n-ايدي المجموعة :*`-100'..data.supergroup.id..'`\n-تم مسح جميع البيانات المتعلقه بالمجموعة',"md")
end
elseif data and data.luatele and data.luatele == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id)
end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id)
end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id)
end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id)
end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id)
end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id)
end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id)
end
elseif text then
if text == Redis:get(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheMaLaTH.."MaLaTH:PinMsegees:"..msg.chat_id)
end
end

elseif data and data.luatele and data.luatele == "updateNewMessage" then
if data.message.content.luatele == "messageChatDeleteMember" or data.message.content.luatele == "messageChatAddMembers" or data.message.content.luatele == "messagePinMessage" or data.message.content.luatele == "messageChatChangeTitle" or data.message.content.luatele == "messageChatJoinByLink" then
if Redis:get(TheMaLaTH.."MaLaTH:Lock:tagservr"..data.message.chat_id) then
LuaTele.deleteMessages(data.message.chat_id,{ [1]= data.message.id })
end
end 
File_Bot_Run(data.message,data.message)

elseif data and data.luatele and data.luatele == "updateMessageEdited" then
--data.chat_id --data.message_id
local Message_Edit = LuaTele.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender.user_id == TheMaLaTH then
print('This is Edit for Bot')
return false
end
File_Bot_Run(Message_Edit,Message_Edit)
Redis:incr(TheMaLaTH..'MaLaTH:Num:Message:Edit'..data.chat_id..Message_Edit.sender.user_id)
if Message_Edit.content.luatele == "messageContact" or Message_Edit.content.luatele == "messageVideoNote" or Message_Edit.content.luatele == "messageDocument" or Message_Edit.content.luatele == "messageAudio" or Message_Edit.content.luatele == "messageVideo" or Message_Edit.content.luatele == "messageVoiceNote" or Message_Edit.content.luatele == "messageAnimation" or Message_Edit.content.luatele == "messagePhoto" then
if Redis:get(TheMaLaTH.."MaLaTH:Lock:edit"..data.chat_id) then
LuaTele.deleteMessages(data.chat_id,{ [1]= data.message_id })
end
end
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
--data.chat_id
--data.payload.data
--data.sender_user_id
Text = LuaTele.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id



--LaR Sudo data --


if Text and Text:match('(%d+)/RRDs') then
local UserId = Text:match('(%d+)/RRDs')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(TheMaLaTH.."MaLaTH:List:Rd:Sudo")
text = "\n-قائمة ردود المطور ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:File"..v) then
db = "ملف 📁"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." -‹ "..v.." › ↫ ‹ "..db.." ›\n"
end
if #list == 0 then
text = "-عذراً لا توجد ردود للمطور"
end
return LuaTele.editMessageText(ChatId,Msg_id,"["..text.."]","md",true)  
end
end

--

if Text and Text:match('(%d+)/RDs') then
local UserId = Text:match('(%d+)/RDs')
if tonumber(IdUser) == tonumber(UserId) then
local Rds = Redis:scard(TheMaLaTH.."MaLaTH:List:Rd:Sudo")
local list = Redis:smembers(TheMaLaTH.."MaLaTH:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Gif"..v)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:vico"..v)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:stekr"..v)     
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Text"..v)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Photo"..v)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Video"..v)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:File"..v)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:Audio"..v)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Sudo:video_note"..v)
Redis:del(TheMaLaTH.."MaLaTH:List:Rd:Sudo")
end
return LuaTele.editMessageText(ChatId,Msg_id,'-تم حذف ‹ '..Rds..' › من ردود المطور',"md",true)  
end
end

--

if Text and Text:match('(%d+)/RSolar') then
local UserId = Text:match('(%d+)/RSolar')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(TheMaLaTH.."MaLaTH11:List:Rd:Sudo")
text = "\n-قائمة الردود المتعدده العامه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
db = "رساله ✉"
text = text..""..k.." -‹ "..v.." › ↫ ‹ "..db.." ›\n"
end
if #list == 0 then
text = "-لا توجد ردود متعدده عامه"
end
return LuaTele.editMessageText(ChatId,Msg_id,""..text.."","md",true)  
end
end

--

if Text and Text:match('(%d+)/RSoLaR') then
local UserId = Text:match('(%d+)/RSoLaR')
if tonumber(IdUser) == tonumber(UserId) then
local R = Redis:scard(TheMaLaTH.."MaLaTH11:List:Rd:Sudo")
local list = Redis:smembers(TheMaLaTH.."MaLaTH11:List:Rd:Sudo")
for k,v in pairs(list) do  
Redis:del(TheMaLaTH.."MaLaTH11:Add:Rd:Sudo:Text"..v) 
Redis:del(TheMaLaTH.."MaLaTH11:Add:Rd:Sudo:Text1"..v) 
Redis:del(TheMaLaTH.."MaLaTH11:Add:Rd:Sudo:Text2"..v)   
Redis:del(TheMaLaTH.."MaLaTH11:List:Rd:Sudo")
end
return LuaTele.editMessageText(ChatId,Msg_id,'-تم حذف ‹ '..R..' › من ردود المتعدده العامه',"md",true)  
end
end


--Lar sudo end --
--Lar Managers data --


if Text and Text:match('(%d+)/Rdlar') then
local UserId = Text:match('(%d+)/Rdlar')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(TheMaLaTH.."MaLaTH1:List:Rd:Sudo"..data.chat_id)
text = "\n-قائمة الردود المتعدده ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
db = "رساله ✉"
text = text..""..k.." -‹ "..v.." › ↫ ‹ "..db.." ›\n"
end
if #list == 0 then
text = "-لا توجد ردود متعدده"
end
return LuaTele.editMessageText(ChatId,Msg_id,""..text.."","md",true)  
end
end

--

if Text and Text:match('(%d+)/RdLaR') then
local UserId = Text:match('(%d+)/RdLaR')
if tonumber(IdUser) == tonumber(UserId) then
local R = Redis:scard(TheMaLaTH.."MaLaTH1:List:Rd:Sudo"..data.chat_id)
local list = Redis:smembers(TheMaLaTH.."MaLaTH1:List:Rd:Sudo"..data.chat_id)
for k,v in pairs(list) do  
Redis:del(TheMaLaTH.."MaLaTH1:Add:Rd:Sudo:Text"..v..data.chat_id) 
Redis:del(TheMaLaTH.."MaLaTH1:Add:Rd:Sudo:Text1"..v..data.chat_id) 
Redis:del(TheMaLaTH.."MaLaTH1:Add:Rd:Sudo:Text2"..v..data.chat_id) 
Redis:del(TheMaLaTH.."MaLaTH1:List:Rd:Sudo"..data.chat_id)
end
return LuaTele.editMessageText(ChatId,Msg_id,'-تم حذف ‹ '..R..' › من ردود المتعدده',"md",true)  
end
end

--

if Text and Text:match('(%d+)/RRD') then
local UserId = Text:match('(%d+)/RRD')
if tonumber(IdUser) == tonumber(UserId) then 
local list = Redis:smembers(TheMaLaTH.."MaLaTH:List:Manager"..data.chat_id.."")
text = "-قائمة ردود المدير ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Gif"..v..data.chat_id) then
db = "متحركه 🎭"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Vico"..v..data.chat_id) then
db = "بصمه 📢"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Stekrs"..v..data.chat_id) then
db = "ملصق 🃏"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Text"..v..data.chat_id) then
db = "رساله ✉"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Photo"..v..data.chat_id) then
db = "صوره 🎇"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Video"..v..data.chat_id) then
db = "فيديو 📹"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:File"..v..data.chat_id) then
db = "ملف 📁"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Audio"..v..data.chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(TheMaLaTH.."MaLaTH:Add:Rd:Manager:video_note"..v..data.chat_id) then
db = "فيديو نوت 🎥"
end
text = text..""..k.." -‹ "..v.." › ↫ ‹ "..db.." ›\n"
end
if #list == 0 then
text = "-عذرا لا يوجد ردود للمدير في المجموعة"
end
LuaTele.editMessageText(ChatId,Msg_id,"["..text.."]", 'md', false)
end
end

--

if Text and Text:match('(%d+)/RD') then
local UserId = Text:match('(%d+)/RD')
if tonumber(IdUser) == tonumber(UserId) then
local R = Redis:scard(TheMaLaTH.."MaLaTH:List:Manager"..data.chat_id.."")
local list = Redis:smembers(TheMaLaTH.."MaLaTH:List:Manager"..data.chat_id.."")
for k,v in pairs(list) do
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Gif"..v..data.chat_id)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Vico"..v..data.chat_id)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Stekrs"..v..data.chat_id)     
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Text"..v..data.chat_id)   
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Photo"..v..data.chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Video"..v..data.chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:File"..v..data.chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:video_note"..v..data.chat_id)
Redis:del(TheMaLaTH.."MaLaTH:Add:Rd:Manager:Audio"..v..data.chat_id)
Redis:del(TheMaLaTH.."MaLaTH:List:Manager"..data.chat_id)
end
return LuaTele.editMessageText(ChatId,Msg_id,'-تم حذف ‹ '..R..' › من ردود المدير',"md",true)  
end 
end


--LaR Managers end --


if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(TheMaLaTH.."MaLaTH:Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = '*-الف مبروك حظك حلو اليوم\n-فزت ويانه وطلعت المحيبس بل عظمه رقم ‹ '..NumMahibes..' ›*'
else
MahibesText = '*-للاسف لقد خسرت المحيبس بالعظمه رقم ‹ '..NumMahibes..' ›\n-جرب حضك ويانه مره اخره*'
end
if NumMahibes == 1 then
Mahibes1 = '🤚' else Mahibes1 = '👊'
end
if NumMahibes == 2 then
Mahibes2 = '🤚' else Mahibes2 = '👊🏻'
end
if NumMahibes == 3 then
Mahibes3 = '🤚' else Mahibes3 = '👊🏼' 
end
if NumMahibes == 4 then
Mahibes4 = '🤚' else Mahibes4 = '👊🏽'
end
if NumMahibes == 5 then
Mahibes5 = '🤚' else Mahibes5 = '👊🏾'
end
if NumMahibes == 6 then
Mahibes6 = '🤚' else Mahibes6 = '👊🏿'
end
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = ''..Mahibes1..'', data = '/*' }, { text = ''..Mahibes2..'', data = '/*' }, 
 },
{ 
{ text = ''..Mahibes3..'', data = '/*' }, { text = ''..Mahibes4..'', data = '/*' }, 
 },
{ 
{ text = ''..Mahibes5..'', data = '/*' }, { text = ''..Mahibes6..'', data = '/*' }, 
 },
{ 
{ text = 'اللعب مره اخرى', data = '/MahibesAgane' },
 },
 }
 }
return LuaTele.editMessageText(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup)
end
if Text == "/MahibesAgane" then
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '👊', data = '/Mahibes1' }, { text = '👊🏻', data = '/Mahibes2' }, 
 },
{ 
{ text = '👊🏼', data = '/Mahibes3' }, { text = '👊🏽', data = '/Mahibes4' }, 
 },
{ 
{ text = '👊🏾', data = '/Mahibes5' }, { text = '👊🏿', data = '/Mahibes6' }, 
 },
 }
 }
local TextMahibesAgane = [[*
-لعبه المحيبس هي لعبة الحظ
-كل ما عليك هوا الضغط على احدى العضمات في الازرار
*]]
return LuaTele.editMessageText(ChatId,Msg_id,TextMahibesAgane, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
 { text = 'اوامر الادمنيه', data = IdUser..'/help2' }, 
 },
{ 
{ text = 'اوامر المدراء', data = IdUser..'/help3' }, { text = 'اوامر المنشئين', data = IdUser..'/help4' }, 
 },
{ 
{ text = 'اوامر مطورين', data = IdUser..'/help5' }, { text = 'العاب البوت', data = IdUser..'/help6' }, 
 },
{ 
{ text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
local TextHelp = [[*
-اوامر الحمايه الخاصه بالمجموعة ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-قفل-فتح + الامر ↫ ‹ بالتقيد-بالطرد-بالكتم ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-الروابط
-المعرف
-التاك
-الشارحه
-التعديل
-التثبيت
-المتحركه
-الملفات
-الصور
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-الماركداون
-البوتات
-التكرار
-الكلايش
-السيلفي
-الملصقات
-الفيديو
-الانلاين
-الدردشه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-التوجيه
-الاغاني
-الصوت
-الجهات
-الاشعارات
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = 'اوامر الحمايه', data = IdUser..'/help1' },
 },
{ 
{ text = 'اوامر المدراء', data = IdUser..'/help3' }, { text = 'اوامر المنشئين', data = IdUser..'/help4' }, 
 },
{ 
{ text = 'اوامر مطورين', data = IdUser..'/help5' }, { text = 'العاب البوت', data = IdUser..'/help6' }, 
 },
{ 
{ text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
local TextHelp = [[*
-اوامر ادمنية ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-رفع-تنزيل ↫ مميز
-تاك للكل-عدد الكروب
-كتم-حظر-طرد-تقيد
-الغاء كتم-الغاء حظر-الغاء تقيد
-منع-الغاء منع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-عرض القوائم ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-المكتومين
-المميزين
-قائمه المنع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-تثبيت-الغاء تثبيت
-الرابط-الاعدادات
-الترحيب-القوانين
-تفعيل-تعطيل ↫ الترحيب
-تفعيل-تعطيل ↫ الرابط
-جهاتي-ايدي-رسائلي
-سحكاتي-مجوهراتي
-كشف البوتات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-وضع-ضع الاوامر التاليه ↫ ⤈
-اسم-رابط-صوره
-قوانين-وصف-ترحيب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-حذف-مسح الاوامر التاليه ↫ ⤈
-قائمه المنع-المحظورين
-المميزين-المكتومين-القوانين
-المطرودين-البوتات-الصوره-الرابط
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = 'اوامر الحمايه', data = IdUser..'/help1' }, { text = 'اوامر الادمنيه', data = IdUser..'/help2' }, 
 },
{ 
 { text = 'اوامر المنشئين', data = IdUser..'/help4' }, 
 },
{ 
{ text = 'اوامر مطورين', data = IdUser..'/help5' }, { text = 'العاب البوت', data = IdUser..'/help6' }, 
 },
{ 
{ text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
local TextHelp = [[*
-اوامر المدراء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-رفع-تنزيل ↫ ادمن
-️︙رفع-كشف ↫ القيود
-تنزيل الكل ↫ ‹ بالرد-بالمعرف ›
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-تغيير رد الرتب في البوت ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-تغير رد + اسم الرتبه والنص
-المطور-المنشئ الاساسي
-المنشئ-المدير-الادمن
-المميز-العضو
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-تفعيل-تعطيل الاوامر التاليه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-الايدي-الايدي بالصوره
-ردود المطور-ردود المدير
-اطردني-الالعاب-الرفع
-الحظر-الرابط-
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-تعين-مسح ↫الايدي
-رفع الادمنيه-مسح الادمنيه
-ردود المدير-مسح ردود المدير
-اضف-حذف + رد
-تنظيف + عدد
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help4') then
local UserId = Text:match('(%d+)/help4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = 'اوامر الحمايه', data = IdUser..'/help1' }, { text = 'اوامر الادمنيه', data = IdUser..'/help2' }, 
 },
{ 
{ text = 'اوامر المدراء', data = IdUser..'/help3' },
 },
{ 
{ text = 'اوامر مطورين', data = IdUser..'/help5' }, { text = 'العاب البوت', data = IdUser..'/help6' }, 
 },
{ 
{ text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
local TextHelp = [[*
-اوامر المنشئ الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-رفع-تنزيل ↫ منشئ
-المنشئين-مسح المنشئين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-اوامر المنشئ المجموعة ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-رفع-تنزيل ↫ مدير
-المدراء-مسح المدراء
-اضف رسائل ↫ ‹ بالرد-بالايدي ›
-اضف مجوهرات ↫ ‹ بالرد-بالايدي ›
-اضف-حذف + الامر
-الاوامر المضافه-مسح الاوامر المضافه
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help5') then
local UserId = Text:match('(%d+)/help5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = 'اوامر الحمايه', data = IdUser..'/help1' }, { text = 'اوامر الادمنيه', data = IdUser..'/help2' }, 
 },
{ 
{ text = 'اوامر المدراء', data = IdUser..'/help3' }, { text = 'اوامر المنشئين', data = IdUser..'/help4' }, 
 },
{ 
 { text = 'العاب البوت', data = IdUser..'/help6' }, 
 },
{ 
{ text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
local TextHelp = [[*
-اوامر المطور الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-حظر عام-الغاء العام
-رفع-تنزيل ↫ مطور
-قائمه العام-مسح قائمه العام
-المطورين-مسح المطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-اضف-حذف ↫ رد للكل
-وضع-حذف ↫ كليشه المطور
-مسح ردود المطور-ردود المطور
-تحديث-تحديث السورس
-تعين عدد الاعضاء + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-تفعيل-تعطيل الاوامر التاليه ↫ ⤈
-البوت الخدمي-المغادرة-الاذاعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-اوامر المطور في البوت ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-تفعيل-تعطيل-الاحصائيات
-رفع-تنزيل ↫ منشئ اساسي
-مسح الاساسين-المنشئين الاساسين
-غادر-غادر + الايدي
-اذاعه-اذاعه بالتوجيه-اذاعه بالتثبيت
-اذاعه خاص-اذاعه خاص بالتوجيه 
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help6') then
local UserId = Text:match('(%d+)/help6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = 'اوامر الحمايه', data = IdUser..'/help1' }, { text = 'اوامر الادمنيه', data = IdUser..'/help2' }, 
 },
{ 
{ text = 'اوامر المدراء', data = IdUser..'/help3' }, { text = 'اوامر المنشئين', data = IdUser..'/help4' }, 
 },
{ 
{ text = 'اوامر مطورين', data = IdUser..'/help5' },
 },
{ 
{ text = '‹ القائمه الرئيسيه › ', data = IdUser..'/helpall' },
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
local TextHelp = [[*
-قائمه الالعاب البوت ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-لعبة المختلف ↫ المختلف
-لعبة الامثله ↫ امثله
-لعبة العكس ↫ العكس
-لعبة الحزوره ↫ حزوره
-لعبة المعاني ↫ معاني
-لعبة البات ↫ بات
-لعبة التخمين ↫ خمن
-لعبه الاسرع ↫ الاسرع
-لعبة السمايلات ↫ سمايلات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-مجوهراتي ↫ لعرض عدد الارباح
-بيع مجوهراتي + العدد ↫ لبيع المجوهرات كل مجوهره مقابل ‹ 50 › رساله
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpall') then
local UserId = Text:match('(%d+)/helpall')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = 'اوامر الحمايه', data = IdUser..'/help1' }, { text = 'اوامر الادمنيه', data = IdUser..'/help2' }, 
 },
{ 
{ text = 'اوامر المدراء', data = IdUser..'/help3' }, { text = 'اوامر المنشئين', data = IdUser..'/help4' }, 
 },
{ 
{ text = 'اوامر مطورين', data = IdUser..'/help5' }, { text = 'العاب البوت', data = IdUser..'/help6' }, 
 },
 { 
{ text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr' }
 },
{ 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
local TextHelp = [[*
-اهلا بك في قائمة الاوامر ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
-م1 ↫ اوامر الحمايه
-م2 ↫ اوامر الادمنيه
-م3 ↫ اوامر المدراء
-م4 ↫ اوامر المنشئين
-م5 ↫ اوامر مطورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Link"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الروابط").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Spam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الكلايش").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Keyboard"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الكيبورد").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الاغاني").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Animation"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل المتحركات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Document"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الملفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الدردشه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Video"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Photo"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الصور").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:User:Name"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل المعرفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:hashtak"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التاك").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل البوتات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:forward"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التوجيه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Audio"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الصوت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Sticker"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الملصقات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Contact"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الجهات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Join"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الدخول").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:AddMempar"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الاضافه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Unsupported"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل بصمه الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:lockpin"..ChatId,(LuaTele.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التثبيت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:tagservr"..ChatId,true)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الاشعارات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Markdaun"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الماركدون").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_edits') then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:edit"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التعديل").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:geam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الالعاب").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheMaLaTH.."MaLaTH:Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التكرار").Lock, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Link"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الروابط").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Spam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الكلايش").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Keyboard"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الكيبورد").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الاغاني").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Animation"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل المتحركات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Document"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الملفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Video"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Photo"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الصور").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:User:Name"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل المعرفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:hashtak"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التاك").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:forward"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التوجيه").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Audio"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الصوت").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Sticker"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الملصقات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Contact"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الجهات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Unsupported"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل بصمه الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Markdaun"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الماركدون").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:geam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الالعاب").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheMaLaTH.."MaLaTH:Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التكرار").lockKid, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Link"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الروابط").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Spam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الكلايش").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الكيبورد").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الاغاني").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Animation"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل المتحركات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Document"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الملفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Video"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Photo"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الصور").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:User:Name"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل المعرفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:hashtak"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التاك").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:forward"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التوجيه").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Audio"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الصوت").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Sticker"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الملصقات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Contact"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الجهات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل بصمه الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الماركدون").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:geam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الالعاب").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheMaLaTH.."MaLaTH:Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التكرار").lockKtm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Link"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الروابط").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Spam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الكلايش").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Keyboard"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الكيبورد").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الاغاني").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Animation"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل المتحركات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Document"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الملفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Video"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Photo"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الصور").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:User:Name"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل المعرفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:hashtak"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التاك").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:forward"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التوجيه").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Audio"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الصوت").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Sticker"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الملصقات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Contact"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الجهات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Unsupported"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل بصمه الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:Markdaun"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الماركدون").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:geam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل الالعاب").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheMaLaTH.."MaLaTH:Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم قفل التكرار").lockKick, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:Link"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:Welcome"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:Id"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:IdPhoto"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:Reply"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر ردود المدير").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:ReplySudo"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر ردود المطور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mostaf_sasa') then
local UserId = Text:match('(%d+)/mostaf_sasa')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Sasa:Jeka"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '`ʙᴀᴄᴋ´', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"*-تم تعطيل ردود السورس *").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:SetId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:BanId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر الطرد -الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:Games"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Status:KickMe"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تعطيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:Link"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:Welcome"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:Id"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:IdPhoto"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:Reply"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر ردود المدير").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:ReplySudo"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر ردود المطور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:SetId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:BanId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر الطرد -الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:Games"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheMaLaTH.."MaLaTH:Status:KickMe"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'listallAddorrem' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم تفعيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/addAdmins@(.*)') then
local UserId = { Text:match('(%d+)/addAdmins@(.*)') }
if tonumber(IdUser) == tonumber(UserId[1]) then
local Info_Members = LuaTele.getSupergroupMembers(UserId[2], "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..UserId[2],v.member_id.user_id) 
x = x + 1
else
Redis:sadd(TheMaLaTH.."MaLaTH:Addictive:Group"..UserId[2],v.member_id.user_id) 
y = y + 1
end
end
end
LuaTele.answerCallbackQuery(data.id, "-تم ترقية ‹ "..y.." › ادمنيه \n-تم ترقية المالك ", true)
end
end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = { Text:match('(%d+)/LockAllGroup@(.*)') }
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(TheMaLaTH.."MaLaTH:Lock:tagservrbot"..UserId[2],true)   
list ={ "Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam" }
for i,lock in pairs(list) do 
Redis:set(TheMaLaTH..'MaLaTH:'..lock..UserId[2],"del")    
end
LuaTele.answerCallbackQuery(data.id, "-تم قفل جميع الاوامر بنجاح  ", true)
end
end
if Text and Text:match('/leftgroup@(.*)') then
local UserId = Text:match('/leftgroup@(.*)')
LuaTele.answerCallbackQuery(data.id, "-تم مغادره البوت من المجموعة", true)
LuaTele.leaveChat(UserId)
end


if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = { Text:match('(%d+)/groupNumseteng//(%d+)') }
if tonumber(IdUser) == tonumber(UserId[1]) then
return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id)
end
end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = { Text:match('(%d+)/groupNum1//(%d+)') }
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
LuaTele.answerCallbackQuery(data.id, "-تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'‹ ✗ ›',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,0, 0, 0, 0,0,0,1,0 })
else
LuaTele.answerCallbackQuery(data.id, "-تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'‹ ✓ ›',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote })
end
end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = { Text:match('(%d+)/groupNum2//(%d+)') }
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "-تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'‹ ✗ ›',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote })
else
LuaTele.answerCallbackQuery(data.id, "-تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'‹ ✓ ›',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote })
end
end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = { Text:match('(%d+)/groupNum3//(%d+)') }
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
LuaTele.answerCallbackQuery(data.id, "-تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'‹ ✗ ›',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote })
else
LuaTele.answerCallbackQuery(data.id, "-تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'‹ ✓ ›',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote })
end
end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = { Text:match('(%d+)/groupNum4//(%d+)') }
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
LuaTele.answerCallbackQuery(data.id, "-تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'‹ ✗ ›',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote })
else
LuaTele.answerCallbackQuery(data.id, "-تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'‹ ✓ ›',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote })
end
end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = { Text:match('(%d+)/groupNum5//(%d+)') }
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "-تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'‹ ✗ ›',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote })
else
LuaTele.answerCallbackQuery(data.id, "-تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'‹ ✓ ›',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote })
end
end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = { Text:match('(%d+)/groupNum6//(%d+)') }
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
LuaTele.answerCallbackQuery(data.id, "-تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'‹ ✗ ›')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0 })
else
LuaTele.answerCallbackQuery(data.id, "-تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'‹ ✓ ›')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{ 0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1 })
end
end
end

if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
LuaTele.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link' },{ text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link' },
 },
{ 
{ text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome' },{ text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome' },
 },
{ 
{ text = 'تعطيل الايدي', data = IdUser..'/'.. 'unmute_Id' },{ text = 'تفعيل الايدي', data = IdUser..'/'.. 'mute_Id' },
 },
{ 
{ text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto' },{ text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto' },
 },
{ 
{ text = 'تعطيل ردود المدير', data = IdUser..'/'.. 'unmute_ryple' },{ text = 'تفعيل ردود المدير', data = IdUser..'/'.. 'mute_ryple' },
 },
{ 
{ text = 'تعطيل ردود المطور', data = IdUser..'/'.. 'unmute_ryplesudo' },{ text = 'تفعيل ردود المطور', data = IdUser..'/'.. 'mute_ryplesudo' },
 },
{ 
{ text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib' },{ text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib' },
 },
{ 
{ text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars' },{ text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars' },
 },
{ 
{ text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games' },{ text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games' },
 },
{ 
{ text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme' },{ text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme' },
 },
{ 
{ text = '‹ القائمه الرئيسيه ›', data = IdUser..'/helpall' },
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr' }
 },
 }
 }
return LuaTele.editMessageText(ChatId,Msg_id,'-اوامر التفعيل والتعطيل الخاصة بالمجموعة ↫ ⤈', 'md', false, false, reply_markup)
end
end
--Lar
if Text and Text:match('(%d+)/MMsgDel') then
local UserId = Text:match('(%d+)/MMsgDel')
if tonumber(IdUser) == tonumber(UserId) then
local MMsgDel = (Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..data.chat_id..':'..UserId) or 0)
Redis:del(TheMaLaTH..'MaLaTH:Num:Message:User'..data.chat_id..':'..UserId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'Rgg' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,'*-تم مسح جميع رسائلك ↫ *‹ *'..MMsgDel..'* ›', 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/MsgDell') then
local UserId = Text:match('(%d+)/MsgDell')
if tonumber(IdUser) == tonumber(UserId) then
local MsgDell = (Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..data.chat_id..UserId) or 0)
Redis:del(TheMaLaTH..'MaLaTH:Num:Message:Edit'..data.chat_id..UserId)
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'Rgg' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,'*-تم مسح جميع سحكاتك ↫ *‹ *'..MsgDell..'* ›', 'md', false, false, reply_markup)
end
end

--LaR




--Lar


if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n-اعدادات المجموعة ".."\n-علامة ال (✓) تعني مقفول".."\n-علامة ال (✗) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = GetSetieng(ChatId).lock_fwd, data = '&' },{ text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd' },
 },
{ 
{ text = GetSetieng(ChatId).lock_muse, data = '&' },{ text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio' },
 },
{ 
{ text = GetSetieng(ChatId).lock_ste, data = '&' },{ text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear' },
 },
{ 
{ text = GetSetieng(ChatId).lock_phon, data = '&' },{ text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone' },
 },
{ 
{ text = GetSetieng(ChatId).lock_join, data = '&' },{ text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine' },
 },
{ 
{ text = GetSetieng(ChatId).lock_add, data = '&' },{ text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem' },
 },
{ 
{ text = GetSetieng(ChatId).lock_self, data = '&' },{ text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote' },
 },
{ 
{ text = GetSetieng(ChatId).lock_pin, data = '&' },{ text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin' },
 },
{ 
{ text = GetSetieng(ChatId).lock_tagservr, data = '&' },{ text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir' },
 },
{ 
{ text = GetSetieng(ChatId).lock_mark, data = '&' },{ text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun' },
 },
{ 
{ text = GetSetieng(ChatId).lock_edit, data = '&' },{ text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits' },
 },
{ 
{ text = GetSetieng(ChatId).lock_geam, data = '&' },{ text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games' },
 },
{ 
{ text = GetSetieng(ChatId).flood, data = '&' },{ text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood' },
 },
{ 
{ text = '‹ رجوع ›', data =IdUser..'/'.. 'NoNextSeting' }
 },
{ 
{ text = '‹ القائمه الرئيسيه ›', data = IdUser..'/helpall' },
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. '/delAmr' }
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n-اعدادات المجموعة ".."\n-علامة ال (✓) تعني مقفول".."\n-علامة ال (✗) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = GetSetieng(ChatId).lock_links, data = '&' },{ text = 'الروابط : ', data =IdUser..'/'.. 'Status_link' },
 },
{ 
{ text = GetSetieng(ChatId).lock_spam, data = '&' },{ text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam' },
 },
{ 
{ text = GetSetieng(ChatId).lock_inlin, data = '&' },{ text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord' },
 },
{ 
{ text = GetSetieng(ChatId).lock_vico, data = '&' },{ text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice' },
 },
{ 
{ text = GetSetieng(ChatId).lock_gif, data = '&' },{ text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif' },
 },
{ 
{ text = GetSetieng(ChatId).lock_file, data = '&' },{ text = 'الملفات : ', data =IdUser..'/'.. 'Status_files' },
 },
{ 
{ text = GetSetieng(ChatId).lock_text, data = '&' },{ text = 'الدردشه : ', data =IdUser..'/'.. 'Status_text' },
 },
{ 
{ text = GetSetieng(ChatId).lock_ved, data = '&' },{ text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video' },
 },
{ 
{ text = GetSetieng(ChatId).lock_photo, data = '&' },{ text = 'الصور : ', data =IdUser..'/'.. 'Status_photo' },
 },
{ 
{ text = GetSetieng(ChatId).lock_user, data = '&' },{ text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username' },
 },
{ 
{ text = GetSetieng(ChatId).lock_hash, data = '&' },{ text = 'التاك : ', data =IdUser..'/'.. 'Status_tags' },
 },
{ 
{ text = GetSetieng(ChatId).lock_bots, data = '&' },{ text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots' },
 },
{ 
{ text = 'التالي', data =IdUser..'/'.. 'NextSeting' }
 },
{ 
{ text = '‹ القائمه الرئيسيه ›', data = IdUser..'/helpall' },
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr' }
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end 

--Lar

if Text and Text:match('(%d+)/TheBasicslar') then
local UserId = Text:match('(%d+)/TheBasicslar')
if tonumber(IdUser) == tonumber(UserId) then 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAlar' }, }, } }
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:TheBasics:Group"..data.chat_id) 
if #Info_Members == 0 then
return LuaTele.editMessageText(ChatId,Msg_id,"-لا يوجد منشئين اساسيين حالياً , ","md",true, false, reply_markup)  
end
ListMembers = '\n*-قائمة المنشئين الاساسيين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md", true, false, reply_markup)
end
end

--

if Text and Text:match('(%d+)/Originatorslar') then
local UserId = Text:match('(%d+)/Originatorslar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAlar' }, }, } }
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Originators:Group"..data.chat_id) 
if #Info_Members == 0 then
return LuaTele.editMessageText(ChatId,Msg_id,"-لا يوجد منشئين حالياً , ","md",true, false, reply_markup)
end
ListMembers = '\n*-قائمة منشئين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup)
end
end

--

if Text and Text:match('(%d+)/Managerslar') then
local UserId = Text:match('(%d+)/Managerslar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAlar' }, }, } }
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Managers:Group"..data.chat_id) 
if #Info_Members == 0 then
return LuaTele.editMessageText(ChatId,Msg_id,"-لا يوجد مدراء حالياً , ","md",true, false, reply_markup)
end
ListMembers = '\n*-قائمة مدراء في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup)
end
end

--

if Text and Text:match('(%d+)/Addictivelar') then
local UserId = Text:match('(%d+)/Addictivelar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAlar' }, }, } }
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Addictive:Group"..data.chat_id) 
if #Info_Members == 0 then
return LuaTele.editMessageText(ChatId,Msg_id,"-لا يوجد ادمنيه حالياً , ","md",true, false, reply_markup)
end
ListMembers = '\n*-قائمة الادمنية في بالمجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup)
end
end

--

if Text and Text:match('(%d+)/DelDistinguishedlar') then
local UserId = Text:match('(%d+)/DelDistinguishedlar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoAlar' }, }, } }
local Info_Members = Redis:smembers(TheMaLaTH.."MaLaTH:Distinguished:Group"..data.chat_id) 
if #Info_Members == 0 then
return LuaTele.editMessageText(ChatId,Msg_id,"-لا يوجد مميزين حالياً , ","md",true, false, reply_markup)
end
ListMembers = '\n*-قائمة المميزين في المجموعة ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -*[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
return LuaTele.editMessageText(ChatId,Msg_id,ListMembers,"md",true, false, reply_markup)
end
end

--

if Text and Text:match('(%d+)/RgoAlar') then
local UserId = Text:match('(%d+)/RgoAlar')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n-هلا بك في قسم رتب المجموعة*"
local L = Redis:scard(TheMaLaTH.."MaLaTH:TheBasics:Group"..data.chat_id) 
local LL = Redis:scard(TheMaLaTH.."MaLaTH:Originators:Group"..data.chat_id) 
local LLL = Redis:scard(TheMaLaTH.."MaLaTH:Managers:Group"..data.chat_id)
local LLLL = Redis:scard(TheMaLaTH.."MaLaTH:Addictive:Group"..data.chat_id)  
local LLLLL = Redis:scard(TheMaLaTH.."MaLaTH:Distinguished:Group"..data.chat_id)
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ الاساسيين : '..L..' ›', data =IdUser..'/'.. 'TheBasicslar' },
 },
{ 
{ text = '‹ المنشئين : '..LL..' ›', data =IdUser..'/'.. 'Originatorslar' },{ text = '‹ المدراء : '..LLL..' ›', data =IdUser..'/'.. 'Managerslar' },
 },
{ 
{ text = '‹ الادمنيه : '..LLLL..' ›', data =IdUser..'/'.. 'Addictivelar' },{ text = '‹ المميزين : '..LLLLL..' ›', data =IdUser..'/'.. 'DelDistinguishedlar' },
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr' }
 },
 }
 }
return LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
end
end 

--

if Text and Text:match('(%d+)/RgoA') then
local UserId = Text:match('(%d+)/RgoA')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n-هلا بك في قسم رتب المجموعة*"
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ مسح الاساسين ›', data =IdUser..'/'.. 'TheBasics' },
 },
{ 
{ text = '‹ مسح المنشئين ›', data =IdUser..'/'.. 'Originators' },{ text = '‹ مسح المدراء ›', data =IdUser..'/'.. 'Managers' },
 },
{ 
{ text = '‹ مسح الادمنيه ›', data =IdUser..'/'.. 'Addictive' },{ text = '‹ مسح المميزين ›', data =IdUser..'/'.. 'DelDistinguished' },
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr' }
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end 

--Lar

if Text and Text:match('(%d+)/Rgg') then
local UserId = Text:match('(%d+)/Rgg')
if tonumber(IdUser) == tonumber(UserId) then
local LaR = (Redis:get(TheMaLaTH..'MaLaTH:Num:Message:Edit'..data.chat_id..UserId) or 0)
local lar = (Redis:get(TheMaLaTH..'MaLaTH:Num:Message:User'..data.chat_id..':'..UserId) or 0)
local Text = "\n-من خلال الازرار يمكنك مسح رسائلك وسحكاتك"
local reply_markup = LuaTele.replyMarkup{ 
type = 'inline',
data = { 
{ 
{ text = '‹ مسح سحكاتي : '..LaR..' ›', data =IdUser..'/'.. 'MsgDell' },{ text = '‹ مسح رسائلي : '..lar..' ›', data =IdUser..'/'.. 'MMsgDel' },
 },
{ 
{ text = '‹ اخفاء الاوامر ›', data =IdUser..'/'.. 'delAmr' }
 },
 { 
{ text = '‹ TeAm LaRiCa ›', url = 't.me/MaLaTHTeam' }, 
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end 

--Lar

if Text and Text:match('(%d+)/delAmr') then
local UserId = Text:match('(%d+)/delAmr')
if tonumber(IdUser) == tonumber(UserId) then
return LuaTele.deleteMessages(ChatId,{ [1]= Msg_id })
end
end
if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الروابط', data =UserId..'/'.. 'lock_link' },{ text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm' },
 },
{ 
{ text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick' },{ text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid' },
 },
{ 
{ text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الروابط", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam' },{ text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm' },
 },
{ 
{ text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick' },{ text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid' },
 },
{ 
{ text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الكلايش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord' },{ text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm' },
 },
{ 
{ text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick' },{ text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid' },
 },
{ 
{ text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الكيبورد", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice' },{ text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm' },
 },
{ 
{ text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick' },{ text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid' },
 },
{ 
{ text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الاغاني", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif' },{ text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm' },
 },
{ 
{ text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick' },{ text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid' },
 },
{ 
{ text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر المتحركات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الملفات', data =UserId..'/'.. 'lock_files' },{ text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm' },
 },
{ 
{ text = 'قفل النلفات بالطرد', data =UserId..'/'.. 'lock_fileskick' },{ text = 'قفل الملقات بالتقييد', data =UserId..'/'.. 'lock_fileskid' },
 },
{ 
{ text = 'فتح الملقات', data =UserId..'/'.. 'unlock_files' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الملفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الدردشه', data =UserId..'/'.. 'lock_text' },
 },
{ 
{ text = 'فتح الدردشه', data =UserId..'/'.. 'unlock_text' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الدردشه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video' },{ text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm' },
 },
{ 
{ text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick' },{ text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid' },
 },
{ 
{ text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الصور', data =UserId..'/'.. 'lock_photo' },{ text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm' },
 },
{ 
{ text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick' },{ text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid' },
 },
{ 
{ text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الصور", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username' },{ text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm' },
 },
{ 
{ text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick' },{ text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid' },
 },
{ 
{ text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر المعرفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل التاك', data =UserId..'/'.. 'lock_tags' },{ text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm' },
 },
{ 
{ text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick' },{ text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid' },
 },
{ 
{ text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر التاك", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots' },{ text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick' },
 },
{ 
{ text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر البوتات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd' },{ text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm' },
 },
{ 
{ text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick' },{ text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid' },
 },
{ 
{ text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر التوجيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio' },{ text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm' },
 },
{ 
{ text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick' },{ text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid' },
 },
{ 
{ text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الصوت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear' },{ text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm' },
 },
{ 
{ text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick' },{ text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid' },
 },
{ 
{ text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الملصقات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone' },{ text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm' },
 },
{ 
{ text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick' },{ text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid' },
 },
{ 
{ text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الجهات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine' },
 },
{ 
{ text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الدخول", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem' },
 },
{ 
{ text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الاضافه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote' },{ text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm' },
 },
{ 
{ text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick' },{ text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid' },
 },
{ 
{ text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر بصمه الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin' },
 },
{ 
{ text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر التثبيت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir' },
 },
{ 
{ text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الاشعارات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun' },{ text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm' },
 },
{ 
{ text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick' },{ text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid' },
 },
{ 
{ text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الماركدون", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits' },
 },
{ 
{ text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر التعديل", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games' },{ text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm' },
 },
{ 
{ text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick' },{ text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid' },
 },
{ 
{ text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر الالعاب", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { 
{ 
{ text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood' },{ text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm' },
 },
{ 
{ text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick' },{ text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid' },
 },
{ 
{ text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood' },
 },
{ 
{ text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' },
 },
 }
 }
LuaTele.editMessageText(ChatId,Msg_id,"-عليك اختيار نوع القفل او الفتح على امر التكرار", 'md', true, false, reply_markup)
end



elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Link"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الروابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Spam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الكلايش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Keyboard"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الكيبورد").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:vico"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الاغاني").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Animation"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح المتحركات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Document"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الملفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الدردشه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Video"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Photo"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الصور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:User:Name"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح المعرفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:hashtak"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح التاك").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Bot:kick"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح البوتات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:forward"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح التوجيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Audio"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الصوت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Sticker"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الملصقات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Contact"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الجهات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Join"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الدخول").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:AddMempar"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الاضافه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Unsupported"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:lockpin"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح التثبيت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:tagservr"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الاشعارات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:Markdaun"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الماركدون").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:edit"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح التعديل").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Lock:geam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(TheMaLaTH.."MaLaTH:Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'NoNextSeting' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"-تم فتح التكرار").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Developers') then
local UserId = Text:match('(%d+)/Developers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Developers:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح مطورين البوت", 'md', false)
end
elseif Text and Text:match('(%d+)/DevelopersQ') then
local UserId = Text:match('(%d+)/DevelopersQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:DevelopersQ:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح مطورين الثانوين من البوت", 'md', false)
end
elseif Text and Text:match('(%d+)/TheBasicsQ') then
local UserId = Text:match('(%d+)/TheBasicsQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:TheBasicsQ:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,"*-تم مسح المالكين بالمجموعة *", 'md', false, false, reply_markup)
end
elseif Text and Text:match('(%d+)/TheBasics') then
local UserId = Text:match('(%d+)/TheBasics')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:TheBasics:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح المنشئين الاساسيين", 'md', false, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Originators') then
local UserId = Text:match('(%d+)/Originators')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Originators:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح المنشئين بالمجموعة", 'md', false, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Managers') then
local UserId = Text:match('(%d+)/Managers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Managers:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح المدراء بالمجموعة", 'md', false, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Addictive') then
local UserId = Text:match('(%d+)/Addictive')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Addictive:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح ادمنيه المجموعة", 'md', false, false, reply_markup)
end
elseif Text and Text:match('(%d+)/DelDistinguished') then
local UserId = Text:match('(%d+)/DelDistinguished')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:Distinguished:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{ type = 'inline',data = { { { text = '‹ رجوع ›', data =UserId..'/'.. 'RgoA' }, }, } }
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح المميزين بالمجموعة", 'md', false, false, reply_markup)
end
elseif Text and Text:match('(%d+)/BanAll') then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:BanAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح المحظورين عام", 'md', false)
end
elseif Text and Text:match('(%d+)/BanGroup') then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:BanGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح المحظورين بالمجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/SilentGroupGroup') then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheMaLaTH.."MaLaTH:SilentGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"-تم مسح المكتومين بالمجموعة", 'md', false)
end
end

end
end


luatele.run(CallBackLua)
 





