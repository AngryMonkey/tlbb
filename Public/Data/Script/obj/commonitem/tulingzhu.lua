--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--tulingzhu.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�
--������

--��������3�ֲ�����
--1.ֱ��ʹ��ʱ��������ʹ�ý���
--2.ʹ�ý����ϵ������λ�����ж�λ
--3.ʹ�ý����ϵ�������͡����д���
--ʹ��������ʱ�����Ľ������ڿͻ���ֱ��Ӳ����ʵ�֣�ʵ���ϲ�û�С�ʹ����Ʒ������˲�����õ����ű��ڡ�
--���ű�Ϊ�������ʹ���߼�������ʹ����������߼�Ϊ�����͡���
--������Ķ�λ��ͨ���ͻ���ֱ��call���ű���x330001_SetPosition����ʵ�֣����������������ʹ���߼���

--�ű���
x330001_g_ScriptId	= 330001

--��ƷID
x330001_g_ItemId = 30008007
x330001_g_ItemId01 = 30505216

--Ч����ID
x330001_g_Impact		= -1	--����ʱҪʹ�õ���Ч�ı��


x330001_g_UseTim		= 10				--ʹ�ô���
x330001_g_Yinpiao		= 40002000	--��Ʊ

--��ͨ�������ƣ���Щ�������޷�����
x330001_g_UselessScn=
{
	125		-- ��ɽ
}

--��ͨ�������ƣ���Щ�������޷���λ
x330001_g_SetPosLimitScn=
{
	125,	-- ��ɽ
	414		-- ������	
}

--��ֹ���͵�ĳЩ�����ĵȼ�����....
x330001_g_LimitTransScene =
{
	{423,90},	--����ɽ
	{519,90},	--�����
	{424,90},	--�߲�
	{520,90},	--�߲��Թ�
	{425,90},	--����ľ
	{427,90},	--���������
	{186,75},	--¥��
	{431,90}, --����
	{432,90}  --��Ѫ��
}



x330001_g_StrCannotUse = "�������޷�ʹ�ô��͵�����£��޷�ʹ�ô��͵��ߡ�"

x330001_g_Impact_NotTransportList = { 5929 } -- ��ֹ���͵�Impact
x330001_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- ��ֹ���͵�Impact��ʾ��Ϣ

--**********************************
--�¼��������
--**********************************
function x330001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end


--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x330001_IsSkillLikeScript( sceneId, selfId )
	return 1	 --����ű���Ҫ����֧��
end


--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x330001_CancelImpacts( sceneId, selfId )
	return 0	 --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end


--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x330001_OnConditionCheck( sceneId, selfId )

	--
	--����ʹ����������߼�Ϊ���ͣ��˴�ֻ��Ҫ���д���ǰ�ļ��Ϳ����ˡ�
	--

	--�����е�λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--У��ʹ�õ���Ʒ
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--�����Ʒ�Ƿ����
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x330001_MsgBox( sceneId, selfId, "����Ʒ�ѱ�������" )
		return 0
	end

	-- ������Ӹ���״̬�£����ܴ���
	if IsTeamFollow(sceneId, selfId) == 1  then
		x330001_MsgBox( sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end

	-- �������ǲ��Ǵ��ڰ�̯״̬��
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		x330001_MsgBox( sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end

	--�жϵ�ǰ״̬�Ƿ��ʹ��(����)
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x330001_MsgBox( sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end

	--�����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x330001_g_Yinpiao) >= 1  then
		x330001_MsgBox(sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x330001_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x330001_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--���õ�ָ��������������λ�㴫��
	for _, tmp in x330001_g_UselessScn do
		if tmp == sceneId then
			x330001_MsgBox( sceneId, selfId, "�˳������޷�ʹ�ã�" )
			return 0
		end
	end
	
	--���Ŀ�곡���Ƿ���90�����ڲ��ܴ��͵ĳ���	--add by xindefeng
	--��ȡ��¼����Ʒ���ϵ����ݽṹ
	local	otim			--ʣ��ʹ�ô���
	local	osid			--�������
	local	opx, opy	--��������
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	if opx > 0 and opy > 0 then	--�Ѿ�����λ��		

		for _, tmp in x330001_g_LimitTransScene do
			if ( (tmp[1] == osid) and (GetLevel(sceneId, selfId) < tmp[2]) ) then
				local szMsg = format("�˳�����Ҫ%d�����Ϸ�������", tmp[2] )
				x330001_MsgBox( sceneId, selfId, szMsg)
				return 0
			end
		end

	end
	
	return 1

end


--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x330001_OnDeplete( sceneId, selfId )

	--ʹ����������д���֮ǰ����ñ�������������Ʒ....

	--
	--�ڴ˻�Ҫ�ٴμ��һ��....
	--
	local ret
	ret = x330001_OnConditionCheck( sceneId, selfId )
	if 0 == ret then
		return 0
	end

	--�����е�λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )

	--��ȡ��¼����Ʒ���ϵ����ݽṹ
	local	otim			--ʣ��ʹ�ô���
	local	osid			--�������
	local	opx, opy	--��������
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--�Ѿ�����λ��....
	if opx > 0 and opy > 0 then

		--��ͬ��������....���Ŀ�곡��������....������ʧ��....
		if sceneId ~= osid then
			if IsCanNewWorld( sceneId, selfId, osid, opx, opy ) ~= 1 then
				x330001_MsgBox( sceneId, selfId, "���ܴ��͵�Ŀ�곡����" )
				return 0
			end
		end

		--���Դ���....��������Ʒ....
		--�����ڴ˴���ֱ������....��Ϊ��x330001_OnActivateOnce()�л���Ҫ������Ʒ���ϵĶ�λ��Ϣ....
		--��˴˴�������Ų��x330001_OnActivateOnce()��....

		return 1

	else

		--��û��λ....������ʧ��....
		x330001_MsgBox( sceneId, selfId, "��ѡ����ʵĵص㶨λ����ʹ�ô��͹��ܡ�" )
		return 0

	end

	return 1

end


--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x330001_OnActivateOnce( sceneId, selfId )

	--
	--����ʹ����������߼�Ϊ���ͣ��˴�ֻ��Ҫ���д��;Ϳ����ˡ�
	--

	--�����е�λ��
	local	bagId			= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )


	--��ȡ��¼����Ʒ���ϵĶ�λ����....
	local	otim			--ʣ��ʹ�ô���....
	local	osid			--�������
	local	opx, opy	--��������
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--�õ���λ���ݺ�Ϳ���������Ʒ��....

	--���ٿ�ʹ�ô���
	otim = otim - 1
	SetBagItemParam( sceneId, selfId, bagId, 3, 0, otim )
	--��¼ͳ����Ϣ
	LuaFnAuditGPS( sceneId, selfId, 0 )
	--ˢ��Client�˵ı�����Ʒ��Ϣ
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )

	--�����ʹ�ô���������ɾ����Ʒ....ɾ��ʧ���򲻴���....
	local ret
	if otim <= 0 then
		ret = EraseItem( sceneId, selfId, bagId )
		if 1 ~= ret then
			return
		end
	end

	--���������ʹ�õ���Ч��ӵ��������....
	if( -1 ~= x330001_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x330001_g_Impact, 0 )
	end

	--���Ѽ�¼����λ��Ϣ����....
	if opx > 0 and opy > 0 then

		if sceneId == osid then
			--ͬһ��������
			SetPos( sceneId, selfId, opx, opy )
		else
			--��ͬ��������
			NewWorld( sceneId, selfId, osid, opx, opy )
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
function x330001_OnActivateEachTick( sceneId, selfId )
	return 1	 --���������Խű�, ֻ�����պ�����
end


--**********************************
--��Ϣ��ʾ
--**********************************
function x330001_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
-- ���ʹ����Ʒ ��λ
--**********************************
function x330001_SetPosition( sceneId, selfId, nItemIndex )

	--
	--��λǰ�ļ��
	--
	
	--��λ�ǿͻ���ֱ��call�������ʵ�ֵ�....����û�о���ʹ����Ʒ�ļ��....
	--�������Ҫ���еȼ����Ƶȼ��....
	if GetLevel(sceneId, selfId)<10  then
		x330001_MsgBox( sceneId, selfId, "�ȼ�����" )
		return
	end

	--�����Ʒ�Ƿ����
	if LuaFnLockCheck( sceneId, selfId, nItemIndex, 0 ) < 0 then
		x330001_MsgBox( sceneId, selfId, "����Ʒ�ѱ�������" )
		return 0
	end

	--����ǲ���������
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x330001_g_ItemId 
		 and GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x330001_g_ItemId01  then
		x330001_MsgBox( sceneId, selfId, "�����ڲ�����" )
		return
	end

	--��������������޷���λ
	if LuaFnGetSceneType( sceneId ) == 1 or LuaFnGetSceneType( sceneId ) == 4 then
		x330001_MsgBox( sceneId, selfId, "��������������޷���λ��" )
		return
	end

	--���õ�ָ���������ܶ�λ
	for _, tmp in x330001_g_SetPosLimitScn do
		if tmp == sceneId then
			x330001_MsgBox( sceneId, selfId, "�˳������޷�ʹ�ã�" )
			return
		end
	end

	--
	--��ʼ��λ
	--

	--��ȡ��¼����Ʒ���ϵ����ݽṹ
	local	otim			--ʣ��ʹ�ô���
	local	osid			--�������
	local	opx, opy	--��������
	otim	= GetBagItemParam( sceneId, selfId, nItemIndex, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, nItemIndex, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, nItemIndex, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, nItemIndex, 8, 1 )

	--�����δ����λ����������Ʒ��Ϣ....
	if otim == 0 and osid == 0 and opx == 0 and opy == 0 then
		otim = x330001_g_UseTim
	end

	--��ȡ��ҵĵ�ǰ����ͳ���ID....
	osid			= sceneId
	opx, opy	= LuaFnGetUnitPosition( sceneId, selfId )
	opx	= floor( opx )
	opy	= floor( opy )

	--����Ϣ���õ���Ʒ��(��λ)....
	SetBagItemParam( sceneId, selfId, nItemIndex, 0, 1, 10 )								--Key����λ��ʶ�������ϣ�Ҳ��Client����Tooltips������
	SetBagItemParam( sceneId, selfId, nItemIndex, 2, 0, x330001_g_UseTim )	--���ʹ�ô���
	SetBagItemParam( sceneId, selfId, nItemIndex, 3, 0, otim )							--ʣ��ʹ�ô���
	SetBagItemParam( sceneId, selfId, nItemIndex, 4, 1, osid )							--�������
	SetBagItemParam( sceneId, selfId, nItemIndex, 6, 1, opx )								--X����
	SetBagItemParam( sceneId, selfId, nItemIndex, 8, 1, opy )								--Y����
	
	--��¼ͳ����Ϣ
	LuaFnAuditGPS( sceneId, selfId, 1 )

	--ˢ��Client�˵ı�����Ʒ��Ϣ
	LuaFnRefreshItemInfo( sceneId, selfId, nItemIndex )

	x330001_MsgBox( sceneId, selfId, "��������鶨λ�ɹ���" )

end
