--л�p 2009-02-17

--�ο�JiaoZi.lua


------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x889031_g_scriptId = 889031

--buff���б�

x889031_g_Impact = {
					[38000006] = { 4849, 4843, 4853, 4852, 4837},
					[38000007] = { 4868, 4866, 4828, 4846, 5723},
					[38000008] = { 4860, 4861, 4872, 4873, 4847}
					}

x889031_g_GiveItem =
{
	30509057,
	30509023,
	30509024,
	30509016,
	30509020,
	30509015,
	30509017,
	30509018,
	30509019,
	30505040,
	30505035,
	30505037,
	30505038,
	30505039,
	30505034,
	30505041
}

--**********************************
--�¼��������
--**********************************
function x889031_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889031_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889031_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889031_OnConditionCheck( sceneId, selfId )

	--����Ƿ���Ա�ʹ��
	if x889031_ItemCheckAndNotice( sceneId, selfId ) ~=1 then
		return 0
	end

	return 1;
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x889031_OnDeplete( sceneId, selfId )
	--�����ģ���Ϊ��߻�Ҫʹ�ô浽��Ʒ�ϵ���Ϣ
	return 1;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x889031_OnActivateOnce( sceneId, selfId )

	--����Ƿ���Ա�ʹ��
	if x889031_ItemCheckAndNotice( sceneId, selfId ) ~=1 then
		return
	end
	
	--����Ʒ
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end

	--���̻�
	local rollItem = random( 1, getn( x889031_g_GiveItem ) )
	local itemIndex = x889031_g_GiveItem[rollItem]
	TryRecieveItem( sceneId, selfId, itemIndex, QUALITY_MUST_BE_CHANGE )
	
	--���Լ��ӱ���BUFF����ͬ����Ʒ�Ӳ�ͬ��BUFF
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	local impactList = x889031_g_Impact[itemTblIndex]
	if impactList ~= nil then
		local rollImpact = random( 1, getn( impactList ) )
		local impactId = impactList[rollImpact]
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactId, 0);
	end
	
	--��ʾ
	x889031_ShowMsg( sceneId, selfId, "#{TWYRJ_090217_1}" )
	
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x889031_OnActivateEachTick( sceneId, selfId )
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889031_ItemCheckAndNotice( sceneId, selfId )
	
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	--�õ�ʹ����Ʒ�ı���λ��
	local bagIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagIndex < 0 then
		return 0
	end
	
	--�Լ��Ķ������ܸ��Լ���
	local ownGUID	= GetBagItemParam( sceneId, selfId, bagIndex, 4, 2 ) + 2147483648
	local selfGUID = LuaFnGetGUID( sceneId, selfId )
	
	if ownGUID == selfGUID then
		x889031_ShowMsg( sceneId, selfId, "#{TWYRJ_090217_13}" )
		return 0
	end
	
	return 1
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x889031_ShowMsg( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent()
	DispatchMissionTips( sceneId, selfId )
	
end
