-- 200017
-- ���������� ������ ���ϵĽű�

x200017_g_ScriptId = 200017
--**********************************
--������ں���
--**********************************
function x200017_OnDefaultEvent( sceneId, selfId, targetId )
	if LuaFnGetCopySceneData_Param(sceneId, 15) == 1  then
		BeginEvent(sceneId)
			AddText( sceneId, "  �ðɣ���Ȼ�����ﲻ�ûڣ��Ҿͷ�����һ����·����������б������Ľ�ҩ�������ȥ��������ֱ������⡣" )
			if IsHaveMission( sceneId, selfId, 15 ) > 0 then
					AddNumText( sceneId, x200017_g_ScriptId, "�õ��������Ľ�ҩ", 6 ,-1  )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

function x200017_OnEventRequest( sceneId, selfId, targetId )

	--�ж�����ǲ������������
	if IsHaveMission( sceneId, selfId, 15 ) > 0 then
		--����������������Ʒ��û��
		if GetItemCount(sceneId, selfId, 40001005) < 1  then
			-- �������Ʒ
	  	BeginAddItem(sceneId)
				AddItem( sceneId, 40001005, 1 )
			local ret = EndAddItem(sceneId,selfId)
			if ret < 1  then
				BeginEvent(sceneId)
					AddText( sceneId, "��ı�������", 0 )
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			else
				AddItemListToHuman(sceneId,selfId)
				BeginEvent(sceneId)
					AddText( sceneId, "��õ��˱������Ľ�ҩ", 0 )
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		else
			BeginEvent(sceneId)
				AddText( sceneId, "�������Ѿ��б������Ľ�ҩ�ˡ�", 0 )
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	
	-- �رնԻ���
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	
end

--**********************************
--�о��¼�
--**********************************
function x200017_OnEnumerate( sceneId, selfId, targetId )

end

--**********************************
--����������
--**********************************
function x200017_CheckAccept( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200017_OnAccept( sceneId, selfId, targetId )

end

--**********************************
--����
--**********************************
function x200017_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x200017_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200017_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x200017_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x200017_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200017_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200017_OnItemChanged( sceneId, selfId, itemdataId )
end
