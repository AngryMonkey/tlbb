--��ɽNPC
--����
--��ͨ

x017035_g_scriptId = 017035

--**********************************
--�¼��������
--**********************************
function x017035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ɽһ������Щѩ�־�ˮ������ˮ��������Щ�һ�Խ��Խ��Ű���������˼�ı���������������շ��ϣ����ھͿ�����ˡ�")
		AddNumText(sceneId,x017035_g_scriptId,"ȥ����ѩ��",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x017035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<61  then	
			BeginEvent( sceneId )
			local strText = "��Щѩ�����������ȼ�����61������������ȥ��ʵ����Σ�ա�"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 147,94,145)
		end
	end
end
