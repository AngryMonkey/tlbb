--����NPC
--���̻�
--��ͨ

x015003_g_scriptId = 015003

--**********************************
--�¼��������
--**********************************
function x015003_OnDefaultEvent( sceneId, selfId,targetId )
	x015003_g_MenPai = GetMenPai(sceneId, selfId)
	if x015003_g_MenPai == 4 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{TYJZ_081103_02}")
			AddNumText(sceneId, x015003_g_scriptId, "ѧϰ����",12,0)
			AddNumText(sceneId, x015003_g_scriptId, "�����ķ��Ľ���",11,10)
			--AddNumText(sceneId, x015003_g_scriptId, "#{JZBZ_081031_02}",11,11)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			
			AddText(sceneId,"���Ǵ��̻�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x015003_OnEventRequest( sceneId, selfId, targetId, eventId )
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

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 4 );
end
