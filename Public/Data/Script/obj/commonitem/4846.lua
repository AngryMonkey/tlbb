--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--4846.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�
--��λ������ɫ����ɫ����ɫ����ɫ����ɫ����ɫ��
--�ű���
x334846_g_ScriptId	= 334846

--Ч����ID
x334846_g_Impact		= -1	--ʹ��һ���ض�����Ч���

--������
x334846_g_Key				= {}
x334846_g_Key["nul"]= 0		--ɶ��û��
x334846_g_Key["log"]= 1		--��¼����
x334846_g_Key["bus"]= 2		--�ɹ�����

--��ͬ�ȼ��Ķ�λ��ʹ�ô�����ͬ
x334846_g_UseTim		= { 8, 13, 20,30 }

x334846_g_Yinpiao = 40002000

x334846_g_Impact_NotTransportList = { 5929 } -- ��ֹ���͵�Impact
x334846_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- ��ֹ���͵�Impact��ʾ��Ϣ

--��ֹ���͵�¥�������ȼ�����	--add by xindefeng
x334846_g_LimitTransLevel = 75

--**********************************
--�¼��������
--**********************************
function x334846_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x334846_IsSkillLikeScript( sceneId, selfId )
	return 1	 --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x334846_CancelImpacts( sceneId, selfId )
	return 0	 --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x334846_OnConditionCheck( sceneId, selfId )

	--�����е�λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--�жϵ�ǰ״̬�Ƿ��ʹ�ö�λ��
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "�����ڲ������͵�״̬������ʹ�ö�λ����" )
		return 0
	end

	--�����Ʒ�Ƿ����
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "����Ʒ�ѱ�������" )
		return 0
	end

	--�����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "����������״̬������ʹ�ö�λ����")
		return 0
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	local	opx, opy	--��������
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )
	local osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )--�Ѷ�λ����ID
	--��δ��¼����λ��Ϣ
	if opx <= 0 and opy <= 0 then
		--�жϵ�ǰ�����Ƿ��ʹ�ö�λ��
		if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--¥��Ҳ������--modify by xindefeng
			x334846_MsgBox( sceneId, selfId, "�������ݡ�����������¥���⣬��������������ʹ�ö�λ����" )
			return 0
		end		
	else	
		--�Ѿ���λ,���Ҷ�λ��¥��,���жϼ���,<90������!--add by xindefeng
		if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
			local szMsg = format("¥����Ҫ%d�����Ϸ�������", x334846_g_LimitTransLevel)
			x334846_MsgBox( sceneId, selfId, szMsg )
			return 0
		end
	end

	--У��ʹ�õ���Ʒ
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	return 1

end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x334846_OnDeplete( sceneId, selfId )
--if( 0 < LuaFnDepletingUsedItem( sceneId, selfId ) ) then
--	return 1
--end
--return 0

	return 1
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x334846_OnActivateOnce( sceneId, selfId )
	if( -1 ~= x334846_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x334846_g_Impact, 0 )
	end
	
	--�����е�λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local	key, tim	= x334846_OnUse( sceneId, selfId )
	
	--�ж��Ƿ�������Ʒ
	if key == x334846_g_Key["bus"] and tim <= 0 then
--	LuaFnDepletingUsedItem( sceneId, selfId )
		if bagId >= 0 then
			EraseItem( sceneId, selfId, bagId )
		end
	end

	return 1
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x334846_OnActivateEachTick( sceneId, selfId )
	return 1	 --���������Խű�, ֻ�����պ�����
end

--**********************************
--ʹ�ã����ز���ָ���Լ�ʣ��ʹ�ô���
--**********************************
function x334846_OnUse( sceneId, selfId )

	--�����е�λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return x334846_g_Key["nul"]
	end

	--�жϵ�ǰ״̬�Ƿ��ʹ�ö�λ��
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "�����ڲ������͵�״̬������ʹ�ö�λ����" )
		return x334846_g_Key["nul"]
	end

	--�����Ʒ�Ƿ����
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "����Ʒ�ѱ�������" )
		return x334846_g_Key["nul"]
	end

	--�����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "����������״̬������ʹ�ö�λ����")
		return x334846_g_Key["nul"]
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--��λ�������ʹ�ô���
	local	oid		= LuaFnGetItemTableIndexByIndex( sceneId, selfId, bagId )
	local	olev	= GetCommonItemGrade( oid )
	local	omax	= x334846_g_UseTim[olev]

	--��ȡ��¼����Ʒ���ϵ����ݽṹ
	local	otim			--��λ����ʣ��ʹ�ô���
	local	osid			--�������
	local	opx, opy	--��������
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--���Ѽ�¼����λ��Ϣ���ͣ������¼��ǰ��Ϣ
	--ͬʱ��ʹ�ô�����1������ֵΪ0ʱɾ������Ʒ
	if opx > 0 and opy > 0 then
		if sceneId == osid then
			--ͬһ��������
			SetPos( sceneId, selfId, opx, opy )
		else
			--¥��<90������--add by xindefeng
			if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
				local szMsg = format("¥����Ҫ%d�����Ϸ�������", x334846_g_LimitTransLevel)
				x334846_MsgBox( sceneId, selfId, szMsg )
				return x334846_g_Key["nul"]
			end
			--����Ƿ�����л���Ŀ�곡��
			if IsCanNewWorld( sceneId, selfId, osid, opx, opy ) ~= 1 then
				return x334846_g_Key["nul"]
			end
			--��ͬ��������
			NewWorld( sceneId, selfId, osid, opx, opy )
		end
		SetBagItemParam( sceneId, selfId, bagId, 3, 0, (otim-1) )
		--��¼ͳ����Ϣ
		LuaFnAuditGPS(sceneId, selfId, 0)

		--ˢ��Client�˵ı�����Ʒ��Ϣ
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )
		return x334846_g_Key["bus"], (otim-1)
	end

	--��¼��λ��Ϣ	
	--�жϵ�ǰ�����Ƿ��ʹ�ö�λ��
	if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--¥��Ҳ������--modify by xindefeng
		x334846_MsgBox( sceneId, selfId, "�������ݡ�����������¥���⣬��������������ʹ�ö�λ����" )
		return x334846_g_Key["nul"]
	end	

	--��ȡ��ҵĵ�ǰ����
	osid			= sceneId
	opx, opy	= LuaFnGetUnitPosition( sceneId, selfId )
	opx	= floor( opx )
	opy	= floor( opy )

	SetBagItemParam( sceneId, selfId, bagId, 0, 1, 10 )		--Key����λ��ʶ�������ϣ�Ҳ��Client����Tooltips������
	SetBagItemParam( sceneId, selfId, bagId, 2, 0, omax )	--���ʹ�ô���
	SetBagItemParam( sceneId, selfId, bagId, 3, 0, omax )	--ʣ��ʹ�ô���
	SetBagItemParam( sceneId, selfId, bagId, 4, 1, osid )	--�������
	SetBagItemParam( sceneId, selfId, bagId, 6, 1, opx )	--X����
	SetBagItemParam( sceneId, selfId, bagId, 8, 1, opy )	--Y����
	--ˢ��Client�˵ı�����Ʒ��Ϣ
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	--��¼ͳ����Ϣ
	LuaFnAuditGPS(sceneId, selfId, 1)

	return x334846_g_Key["log"], omax
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x334846_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
