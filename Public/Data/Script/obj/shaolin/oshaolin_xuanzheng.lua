--����NPC
--��֤
--��ͨ

x009035_g_scriptId = 009035

--**********************************
--�¼��������
--**********************************
function x009035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��֪����ʲôԭ��ľ�����е�ľ��һʱ�޷����ƣ������ܵ����ж��ǣ���ʩ����ü��Ŀ������������Ļ��ᣬ���Ը����")
		AddNumText(sceneId,x009035_g_scriptId,"��ľ�˶���",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x009035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<41  then	
			BeginEvent( sceneId )
			local strText = "���µ�ľ����Ȼ�ô򣬵�ʩ���ȼ�����41��������������������ɮ�����ǹ��������ɡ�"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 139,95,141)
		end
	end
end
