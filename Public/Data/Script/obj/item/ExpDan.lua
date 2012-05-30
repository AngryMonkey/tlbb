--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


------------------------------------------------------------------------------------------
--�����̲���ʹ�ýű�

--�ű���
x889035_g_scriptId = 889035 

x889035_ExpDan = {{ID =30504067,Exp =5355,flag =MF_TW_EXPDAN10},
		{ID =30504055,Exp =21665,flag =MF_TW_EXPDAN20},
		{ID =30504056,Exp =105080,flag =MF_TW_EXPDAN30},
		{ID =30504057,Exp =348381,flag =MF_TW_EXPDAN40},
		{ID =30504058,Exp =700000,flag =MF_TW_EXPDAN50},
	}

--**********************************
--�¼��������
--**********************************
function x889035_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889035_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889035_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889035_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
		--�����ƷID
	local Item = LuaFnGetItemIndexOfUsedItem(sceneId, selfId)
	local iIndex = -1
	for i=1,getn(x889035_ExpDan) do
		if (x889035_ExpDan[i].ID == Item) then
			iIndex = i
		end
	end

	if (iIndex ==-1) then
		return 0
	end
		
	--�Ƿ�μӹ��û
	local bHave = GetMissionFlag(sceneId, selfId, x889035_ExpDan[iIndex].flag)
	if (bHave ==1) then
		BeginEvent( sceneId )
			AddText( sceneId, "#{TSJH_090224_27}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
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
function x889035_OnDeplete( sceneId, selfId )
	
		--�����ƷID
	local Item = LuaFnGetItemIndexOfUsedItem(sceneId, selfId)
	local iIndex = -1
	for i=1,getn(x889035_ExpDan) do
		if (x889035_ExpDan[i].ID == Item) then
			iIndex = i
		end
	end
	if (iIndex ==-1) then
		return 0
	end

	local ExpBonus = x889035_ExpDan[iIndex].Exp;
	AddExp( sceneId, selfId, ExpBonus )
	SetMissionFlag(sceneId, selfId, x889035_ExpDan[iIndex].flag, 1)
	if (Item == 30504058) then
		local szTransfer;
	
		local szPlayerName = LuaFnGetName( sceneId, selfId );
	
		local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30504058);
		if nItemBagIndex >= 0 then		
			szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);
		end

		local message = format("#{_INFOUSR%s}#{TSJH_090224_28}#{_INFOMSG%s}#{TSJH_090224_29}", szPlayerName, szTransfer );	
		AddGlobalCountNews( sceneId, message )
	end
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
function x889035_OnActivateOnce( sceneId, selfId )

	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x889035_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end


--**********************************
--��Ŀ��ʾ
--**********************************
function x889035_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
