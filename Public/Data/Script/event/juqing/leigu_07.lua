-- ���������ϵĽű�����ҵ������ս

x200046_g_MissionId = 37
x200046_g_ScriptId = 200046

--**********************************
--������ں���
--**********************************
function x200046_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if GetNumText() == 1  then
		-- ���������Ӫ�����Կ�ʼ��ս
		if GetName(sceneId, targetId) == "������"  then
			SetUnitReputationID(sceneId, selfId, targetId, 29)
			SetMonsterFightWithNpcFlag(sceneId, targetId, 1)
			SetNPCAIType(sceneId, targetId, 16)
			
			BeginEvent(sceneId)
				AddText(sceneId, "�����ǻ�Ĳ��ͷ���!")
			EndEvent()
			DispatchEventList(sceneId,selfId,targetId,x200046_g_ScriptId,x200046_g_MissionId)
	
			-- �ı���������Ǻӵ���Ӫ��AI
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				if GetName(sceneId, nMonsterId)  == "����"  then
					SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 16)
				end
				if GetName(sceneId, nMonsterId)  == "���Ǻ�"  then
					SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 16)
				end
			end
			
			-- �رս���
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
			
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200046_OnEnumerate( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200046_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200046_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		AddNumText(sceneId, x200046_g_ScriptId,"��ս������",10,1)
	end

end

--**********************************
--����������
--**********************************
function x200046_CheckAccept( sceneId, selfId )
	--�ж�����
end


--**********************************
--����
--**********************************
function x200046_OnAccept( sceneId, selfId, targetId )

end

--**********************************
--����
--**********************************
function x200046_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x200046_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200046_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200046_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x200046_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200046_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200046_OnItemChanged( sceneId, selfId, itemdataId )
	
end





