--��ңNPC
--ʯ����
--��ͨ

--�ű���
x014012_g_ScriptId = 014012


--**********************************
--�¼��������
--**********************************
function x014012_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �ҿ��Դ��ڸ��㱾�ɵĶ����Ṧ��������Ҫ����1#-15��")
		AddNumText(sceneId, x014012_g_ScriptId, "ѧϰ��ң�Ṧ",12,0)
	EndEvent(sceneId)
	
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x014012_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText()==0	then
		
		if GetMenPai(sceneId, selfId) == 8 then
			if	HaveSkill( sceneId, selfId, 31)<0	then
				-- ���Ǯ
				if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) < STUDY_MENPAI_QINGGONG_SPEND  then
					BeginEvent(sceneId)
						AddText(sceneId,"  �����ϵ��ֽ���1#-15������޷�ѧϰ�����Ṧ��")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					return
				end
				-- ��Ǯ
				LuaFnCostMoneyWithPriority(sceneId,selfId,STUDY_MENPAI_QINGGONG_SPEND)

				AddSkill( sceneId, selfId, 31 )
				DelSkill( sceneId, selfId, 34 )
				BeginEvent(sceneId)
					AddText(sceneId,"  ��ϲ��ѧ�᱾�ŵ��Ṧ��ϣ��Ϊ���ŵķ��������Ŭ����")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"�㲻���Ѿ�ѧ������")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		elseif GetMenPai(sceneId, selfId) == 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"ѧϰ��ң�Ṧ��Ҫ�ȼ�����ң��Ŷ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"�㲻����ң�ɵĵ��ӣ����ǲ��ܽ��㱾���Ṧ�ġ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x014012_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x014012_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
end

--**********************************
--�������Ѿ���������
--**********************************
function x014012_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ύ�����������
--**********************************
function x014012_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
end

--**********************************
--�����¼�
--**********************************
function x014012_OnDie( sceneId, selfId, killerId )
end
