--�䵱NPC
--��Զɽ
--��ͨ

x012010_g_scriptId = 012010

--**********************************
--�¼��������
--**********************************
function x012010_OnDefaultEvent( sceneId, selfId,targetId )
	x012010_g_MenPai = GetMenPai(sceneId, selfId)
	if x012010_g_MenPai == 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{TYJZ_081103_02}")
			AddNumText(sceneId, x012010_g_scriptId, "ѧϰ����",12,0)
			AddNumText(sceneId, x012010_g_scriptId, "�����ķ��Ľ���",11,10)
			--AddNumText(sceneId, x012010_g_scriptId, "#{JZBZ_081031_02}",11,11)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"��������ʲô�£�")
			AddNumText(sceneId, x012010_g_scriptId, "�����ķ��Ľ���",11,10)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x012010_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_xinfajieshao_001}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	elseif GetNumText() == 11 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{JZBZ_081031_01}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 3 );
end
