--Ѿ��

--�ű���
x020004_g_scriptId = 020004

--**********************************
--�¼��б�
--**********************************
function x020004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "����"
		else
			PlayerSex = "����"
		end
		AddText(sceneId,"  "..PlayerSex.."#{OBJ_caoyuan_0005}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�����¼�
--**********************************
function x020004_OnDie( sceneId, selfId, killerId )
end
