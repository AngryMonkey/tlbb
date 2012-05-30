--�����й�Ҫ��

x889024_g_scriptId = 889024

x889024_g_NoRMBBuffID = 5901  --��RMB
x889024_g_RMBBuffID = 5902		--RMB�һ���buff��ID....
x889024_g_SpouseBuffID = 5704


--**********************************
--�¼��������
--**********************************
function x889024_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889024_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889024_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889024_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local lastDayTime = GetMissionData( sceneId, selfId, MD_TW_HANYU_SPOUSEBOOK_LASTUSEDAY )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		x889024_ShowTips( sceneId, selfId, "#{FUQIYAOJUE_2}" )
		return 0
	end
	
	if LuaFnIsMarried(sceneId, selfId) == 0 then
		x889024_ShowTips( sceneId, selfId, "#{FUQIYAOJUE_3}" )
		return 0
	end

	if sceneId ~= 194 then
		x889024_ShowTips( sceneId, selfId, "#{FUQIYAOJUE_4}" )
		return 0
	end
	
	local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
	if LuaFnGuid2ObjId(sceneId, spouseGuid) == -1 then		
		x889024_ShowTips( sceneId, selfId, "#{FUQIYAOJUE_5}" )
		return 0
	end

	--��ǰ�Ƿ����йһ�buff....
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x889024_g_NoRMBBuffID ) == 1 
		or LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x889024_g_RMBBuffID ) == 1 
		or LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x889024_g_SpouseBuffID ) == 1 then		
		x889024_ShowTips( sceneId, selfId, "#{FUQIYAOJUE_6}" )
		return 0
	end
	
	return 1; --����Ҫ�κ�����������ʼ�շ���1��

end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x889024_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x889024_OnActivateOnce( sceneId, selfId )

	--����Һ��񴲹һ�buff....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x889024_g_SpouseBuffID, 0)

	CallScriptFunction( 808072, "OnPlayerUseHanYuBook", sceneId, selfId )

	--��¼�����ù�����....
	local CurDayTime = GetDayTime()
	SetMissionData( sceneId, selfId, MD_TW_HANYU_SPOUSEBOOK_LASTUSEDAY, CurDayTime )

	return 1

end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x889024_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end


function x889024_ShowTips( sceneId, selfId, msg)
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
