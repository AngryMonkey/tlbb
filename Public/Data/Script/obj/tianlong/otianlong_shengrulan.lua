--������NPC
--ʢ����
--��ͨ

--�ű���
x013011_g_ScriptId = 013011

--**********************************
--�¼��������
--**********************************
function x013011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �ҿ��Դ��ڸ��㱾�ɵĶ����Ṧ��������Ҫ����1#-15��")
		AddNumText(sceneId, x013011_g_ScriptId, "ѧϰ�������Ṧ",12,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x013011_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		
		if GetMenPai(sceneId, selfId) == 6 then
			if	HaveSkill( sceneId, selfId, 29)<0	then
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

				AddSkill( sceneId, selfId, 29 )
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
				AddText(sceneId,"ѧϰ�������Ṧ��Ҫ�ȼ�������ɣ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"�㲻�Ǳ����ɵĵ��ӣ����ǲ��ܽ���������Ṧ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x013011_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x013011_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
end

--**********************************
--�������Ѿ���������
--**********************************
function x013011_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ύ�����������
--**********************************
function x013011_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
end

--**********************************
--�����¼�
--**********************************
function x013011_OnDie( sceneId, selfId, killerId )
end
