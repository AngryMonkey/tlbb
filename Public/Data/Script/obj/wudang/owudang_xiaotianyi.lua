--�䵱NPC
--������
--��ͨ

x012035_g_scriptId = 012035

--**********************************
--�¼��������
--**********************************
function x012035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������֮ʿ���Ի�������ħ֮�£�����ʦ���䵱ɽ���´��󣬿��л���ս����ħ����Ը�������Լ���ʵ����")
		AddNumText(sceneId,x012035_g_scriptId,"ȥ��ս��ħ",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x012035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<71  then	
			BeginEvent( sceneId )
			local strText = "��ν�����⣬�����ڣ���ĵȼ�����71�������Խ��룬���»��߻���ħ����"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 142,91,183)
		end
	end
end
