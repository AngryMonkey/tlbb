--�Ϻ�NPC
--������
--��ͨ

--�ű���
x034003_g_ScriptId = 34003

--**********************************
--�¼��������
--**********************************
function x034003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ǰ��ʱ�������Ҳͦ�õģ�ֻ����Ϊ����һЩ���ˣ�û����ʲô��Ļ��¡����ǣ������ģ���֪����ô���£���Щ���ӿ�ʼ�����ǻ������������黹���ϴ���������������������")
		
		-- �����������С����ס����������ĺ��ǡ���������񣬿����������õ���
		if IsHaveMission(sceneId,selfId,568) > 0 then
			-- �ж���������ǲ�������Ʒ�� 
			local itemCount
			itemCount = GetItemCount( sceneId, selfId, 40001039 )
			if itemCount < 1   then
				AddNumText(sceneId,x034003_g_ScriptId,"�õ�һ��������Ƥ",7,666);
			end
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x034003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if	GetNumText()==666	then
		local itemCount
		itemCount = GetItemCount( sceneId, selfId, 40001039 )
		if itemCount < 1   then
			BeginAddItem( sceneId )
				AddItem( sceneId, 40001039, 1 )
			local ret = EndAddItem( sceneId, selfId )
			if ret <= 0 then 
				--��ʾ���ܽ�������
				Msg2Player(  sceneId, selfId,"#Y������񱳰��Ѿ����ˡ�", MSG2PLAYER_PARA )
			else
				AddItemListToHuman(sceneId,selfId)
			end
		end
	end
end


