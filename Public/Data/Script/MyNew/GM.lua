--大理NPC
--还可以天龙GM脚本


--脚本号
x002968_g_scriptId = 002968

--**********************************
--事件列表
--**********************************
function x002968_OnDefaultEvent( sceneId, selfId,targetId )
    local    nam    = LuaFnGetName( sceneId, selfId )
       if nam~="试试就试试" and nam~="秀哥哥" and nam~="哥哥我要" and nam~="AngryMonkey"  then
        AddText( sceneId, "对不起，你不是GM,无法使用GM功能。" )
        return
    end
    BeginEvent( sceneId )
            AddText(sceneId,"GM控制台，可以使用GM功能了。") 
           AddNumText( sceneId, x002968_g_scriptId, "维护公告", 6, 10 )
              AddNumText( sceneId, x002968_g_scriptId, "开心游戏", 6, 11 )
    --    AddNumText( sceneId, x002968_g_scriptId, "GM2.5倍经验", 6, 12 )
              AddNumText( sceneId, x002968_g_scriptId, "隐身状态", 6, 13 )
              AddNumText( sceneId, x002968_g_scriptId, "加速状态", 6, 14 )
        EndEvent(sceneId)
        DispatchEventList(sceneId,selfId,targetId)

  end


--**********************************
--事件列表选中一项
--**********************************
function x002968_OnEventRequest( sceneId, selfId, targetId, eventId )

if GetNumText()  == 10 then
        local    str    = format ("@*;SrvMsg;SCA:服务器正常维护重启，四绝看好了没，请大家安全下线！" )
        BeginEvent( sceneId )
        AddGlobalCountNews( sceneId, str )
        EndEvent( sceneId )
--        DispatchEventList( sceneId, selfId, targetId )
    end


if GetNumText()  == 11 then
        local    str    = format ("@*;SrvMsg;SCA:服务器长期开放，希望大家玩的开心！" )
        BeginEvent( sceneId )
        AddGlobalCountNews( sceneId, str )
        EndEvent( sceneId )
--        DispatchEventList( sceneId, selfId, targetId )
    end

    

if GetNumText() == 13 then
            
            LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 109, 0 )
            return
    end



if GetNumText() == 14 then
            
            LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 30211, 0 )
            return
    end
end
