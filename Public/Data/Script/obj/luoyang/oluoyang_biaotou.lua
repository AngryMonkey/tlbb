--����NPC
--��ͷ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000072_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ھֳ��ŵ�һ���屡���죬�úڰ������������������ܱ�֤����ʮ�겻���ڡ�"..PlayerName..PlayerSex.."����ʲô��Ҫ�������ܿ��ڣ��ϵ�ɽ���»𺣣��Ҹ�ǧ���۶���գһ�¡�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
