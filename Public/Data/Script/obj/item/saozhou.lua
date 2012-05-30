--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű���
x300020_g_ScriptId = 300020

--�����
x300020_g_MissionId = 1060

x300020_g_Impact = 213

x300020_g_TreasureAddress = {{scene=9,x1=84,x2=108,z1=64,z2=86},
						{scene=9,x1=122,x2=146,z1=132,z2=159},
						{scene=9,x1=89,x2=102,z1=110,z2=137},
						{scene=9,x1=54,x2=83,z1=52,z2=71}}

--**********************************
--�¼��������
--**********************************
function x300020_OnDefaultEvent( sceneId, selfId, bagIndex )
--ɨ��
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300020_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300020_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300020_OnConditionCheck( sceneId, selfId )
	local x,z = GetWorldPos( sceneId, selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x300020_g_MissionId)
	if	sceneId ~= x300020_g_TreasureAddress[1].scene  then
		Msg2Player( sceneId,selfId,"��������޷����д�ɨ",MSG2PLAYER_PARA) --֪ͨ���
		return 0
	elseif	IsHaveMission(sceneId,selfId,x300020_g_MissionId) > 0	 then
		if	GetMissionParam( sceneId, selfId, misIndex,4) == 1  then
			if	x>x300020_g_TreasureAddress[1].x1  and  x<x300020_g_TreasureAddress[1].x2  and  z>x300020_g_TreasureAddress[1].z1  and  z<x300020_g_TreasureAddress[1].z2  then
				if	GetMissionParam( sceneId, selfId, misIndex,0) >= 1  then
					Msg2Player( sceneId,selfId,"����Ѿ���ɨ�ɾ���",MSG2PLAYER_PARA) --֪ͨ���
					return 0
				else
					Msg2Player( sceneId,selfId,"�㿪ʼ��ɨ����",MSG2PLAYER_PARA) --֪ͨ���
					return 1
				end
			else
				Msg2Player( sceneId,selfId,"��Ҫ�����",MSG2PLAYER_PARA) --֪ͨ���
				return 0
			end
		elseif	GetMissionParam( sceneId, selfId, misIndex,4) == 2  then
			if  x>x300020_g_TreasureAddress[2].x1  and  x<x300020_g_TreasureAddress[2].x2  and  z>x300020_g_TreasureAddress[2].z1  and  z<x300020_g_TreasureAddress[2].z2  then
				if	GetMissionParam( sceneId, selfId, misIndex,0) >= 1  then
					Msg2Player( sceneId,selfId,"�ؾ����Ѿ���ɨ�ɾ���",MSG2PLAYER_PARA) --֪ͨ���
					return 0
				else
					Msg2Player( sceneId,selfId,"�㿪ʼ��ɨ�ؾ��󡭡�",MSG2PLAYER_PARA) --֪ͨ���
					return 1
				end
			else
				Msg2Player( sceneId,selfId,"��Ҫ���ؾ���",MSG2PLAYER_PARA) --֪ͨ���
				return 0
			end
		elseif	GetMissionParam( sceneId, selfId, misIndex,4) == 3  then
			if  x>x300020_g_TreasureAddress[3].x1  and  x<x300020_g_TreasureAddress[3].x2  and  z>x300020_g_TreasureAddress[3].z1  and  z<x300020_g_TreasureAddress[3].z2  then
				if	GetMissionParam( sceneId, selfId, misIndex,0) >=1  then
					Msg2Player( sceneId,selfId,"ɽ���Ѿ���ɨ�ɾ���",MSG2PLAYER_PARA) --֪ͨ���
					return 0
				else
					Msg2Player( sceneId,selfId,"�㿪ʼ��ɨɽ�š���",MSG2PLAYER_PARA) --֪ͨ���
					return 1
				end
			else
				Msg2Player( sceneId,selfId,"��Ҫ��ɽ��",MSG2PLAYER_PARA) --֪ͨ���
				return 0
			end		
		elseif	GetMissionParam( sceneId, selfId, misIndex,4) == 4  then
			if  x>x300020_g_TreasureAddress[4].x1  and  x<x300020_g_TreasureAddress[4].x2  and  z>x300020_g_TreasureAddress[4].z1  and  z<x300020_g_TreasureAddress[4].z2  then
				if	GetMissionParam( sceneId, selfId, misIndex,0) >= 1  then
					Msg2Player( sceneId,selfId,"��¥�Ѿ���ɨ�ɾ���",MSG2PLAYER_PARA) --֪ͨ���
					return 0
				else
					Msg2Player( sceneId,selfId,"�㿪ʼ��ɨ��¥����",MSG2PLAYER_PARA) --֪ͨ���
					return 1
				end
			else
				Msg2Player( sceneId,selfId,"��Ҫ����¥",MSG2PLAYER_PARA) --֪ͨ���
				return 0
			end
		end
	else
		return 0
	end
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x300020_OnDeplete( sceneId, selfId )
	return 1; --������
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300020_OnActivateOnce( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x300020_g_MissionId)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5900, 0);
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	BeginEvent(sceneId)
		AddText(sceneId,"��ɨ�ɾ��ˣ�������ɣ�")
	EndEvent( )
	DispatchMissionTips(sceneId,selfId)
	Msg2Player( sceneId,selfId,"��ɨ�ɾ��ˣ��������",MSG2PLAYER_PARA) --֪ͨ���
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300020_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
