--丫鬟

--脚本号
x020004_g_scriptId = 020004

--**********************************
--事件列表
--**********************************
function x020004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "姑娘"
		else
			PlayerSex = "少侠"
		end
		AddText(sceneId,"  "..PlayerSex.."#{OBJ_caoyuan_0005}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--死亡事件
--**********************************
function x020004_OnDie( sceneId, selfId, killerId )
end
