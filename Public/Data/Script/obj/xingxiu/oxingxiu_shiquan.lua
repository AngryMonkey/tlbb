--����NPC
--ʩȫ
--��ͨ

x016007_g_scriptId = 016007

--**********************************
--�¼��������
--**********************************
function x016007_OnDefaultEvent( sceneId, selfId,targetId )
	x016007_g_MenPai = GetMenPai(sceneId, selfId)
	if x016007_g_MenPai == 5 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{XXJZ_081103_01}")
			AddNumText(sceneId, x016007_g_scriptId, "ѧϰ����",12,0)
			
			AddNumText(sceneId, x016007_g_scriptId, "�����ķ��Ľ���",11,10)
			--AddNumText(sceneId, x016007_g_scriptId, "#{JZBZ_081031_02}",11,11)
			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"����ʩȫ")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x016007_OnEventRequest( sceneId, selfId, targetId, eventId )

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

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 5 );
end
