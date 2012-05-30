--------------------------------------------
--���˱�����߽ű�
--Created By �ŵ·�
--------------------------------------------

--�ű�ID
x335136_g_scriptId = 335136

--���˱���ID
x335136_g_YuRenBaoZhuID = 30501161

--���ʹ�ô���
x335136_g_CanUseMaxCount = 5

x335136_g_CanUseCity = {[1] = SCENE_LUOYANG,[2] = SCENE_SUZHOU,[3] = SCENE_DALI,
	                      [4] = SCENE_LOULAN,[5] = 71,[6] = 72}
--Ч������
x335136_g_ImpactCount = 10

--Ч��ID��
x335136_g_ImpactTable = { 
	[1] = 
	{													
		[1] = 5000,
		[2] = 5001,
		[3] = 5002,
		[4] = 5003,
		[5] = 5004,
		[6] = 5005,
		[7] = 5006,
		[8] = 5007,
		[9] = 5008,
		[10] = 5009
	},
	[2] =
	{
		[1] = 5014,
		[2] = 5015,
		[3] = 5016,
		[4] = 5017,
		[5] = 5018,
		[6] = 5019,
		[7] = 5020,
		[8] = 5021,
		[9] = 5022,
		[10] = 5023
	}
	

												}

--�����Ч��ID
x335136_g_LuoMaJianImpactID = 154


--**********************************
--�¼��������
--**********************************
function x335136_OnDefaultEvent( sceneId, selfId, bagIndex )	
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x335136_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x335136_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x335136_OnConditionCheck( sceneId, selfId )
	--���Item�Ƿ���Ч
	if(LuaFnVerifyUsedItem(sceneId, selfId) == 0) then
		return 0;	--Item��Чֱ�ӷ���
	end
	-- zchw
	local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	--���ܸ��Լ�ʹ��
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)--����ID
	if((targetId == selfId) or (targetId < 0))then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_SelfUseTip}")	--���ܸ��Լ�ʹ��
			return 0;
	end
	
	--ֻ�ܸ����ʹ��
	local objType = GetCharacterType( sceneId, targetId )--��������
	if(objType ~= 1)then	--������Human
		x335136_MsgBox( sceneId, selfId, "#{ResultText_8}")	--��ЧĿ��
		return 0
	end
	
	--�����Ʒ�Ƿ����
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	--�����е�λ��
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x335136_MsgBox( sceneId, selfId, "#{Item_Locked}" )	--��Ʒ�Ѽ���
		return 0
	end
	
	--�������ǲ��Ǵ��ڰ�̯״̬
	if LuaFnIsStalling(sceneId, selfId) == 1  then
	  if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_LimitStallageTip}")	--�޷��԰�̯״̬�����ʹ�����˱���
		else
			x335136_MsgBox( sceneId, selfId, "�޷��԰�̯״̬�����ʹ��ʦͽ����");
		end
		return 0
	end
	
	--���Է��Ƿ���BUS��
	if(LuaFnIsInBus(sceneId, selfId, targetId) == 1)then
		if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_TargetInBusTip}")	--�޷���BUS״̬�����ʹ�����˱���
		else
			x335136_MsgBox( sceneId, selfId, "�޷���BUFF״̬�����ʹ��ʦͽ����");
		end
		return 0
	end
	
	--���Է��Ƿ���˫�������
	if(LuaFnGetDRide(sceneId, selfId, targetId) == 1)then
		if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_DoubleRideTip}")	--�޷���˫����˵����ʹ�����˱��顣
		else
			x335136_MsgBox( sceneId, selfId, "�޷���˫����˵����ʹ��ʦͽ����");
		end
		return 0
	end
	
	--�������Ƿ����Ĵ�������(����¥��),�����,�������Ҳ�����
  local flag = 0 
  for i,_ in x335136_g_CanUseCity do
  	if sceneId == x335136_g_CanUseCity[i] then
  		 flag = 1
  	end
  end
  if flag == 0 then --0��ʾ��Ҳ����Ĵ�������
		if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_LimitCityTip}")	--ֻ���ڳ�����ʹ�����˱���
		else
			x335136_MsgBox( sceneId, selfId, "#{STBZ_090324_1}")
		end
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
function x335136_OnDeplete( sceneId, selfId )	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335136_OnActivateOnce( sceneId, selfId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if(targetId < 0) then	--Ŀ�겻�Ϸ�
		return 0
	end
	
	--��ȡ"����"���ڱ����е�λ��
	local	bagId = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)
	--zchw
  local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	--��ȡ��¼����Ʒ���ϵĶ�λ����
	local	CurUseCount		= GetBagItemParam( sceneId, selfId, bagId, 8, 2 )	--��ȡʣ��ʹ�ô���	
	if(CurUseCount == 0)then	--��һ��ʹ��
		CurUseCount = x335136_g_CanUseMaxCount		
	end
  
	--���ٿ�ʹ�ô���
	CurUseCount = CurUseCount - 1
	if(CurUseCount <= 0) then
		local ret = EraseItem( sceneId, selfId, bagId )		
		if ret ~= 1 then
			return 0--ɾ��ʧ��
		end
	end
	
	--����һ������
	SetBagItemParam( sceneId, selfId, bagId, 4, 2, x335136_g_CanUseMaxCount )--�������ʹ�ô���
	SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurUseCount )--���滹����ʹ�ô���
	
	--ˢ��Client�˵ı�����Ʒ��Ϣ
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	
	--��Ч��
	local bRet = LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x335136_g_LuoMaJianImpactID, 0)	--��ʹ�������Ч��
	
	if (bRet == 1) then	--������ɹ�
	  -- zchw
	  if (itemIndex == x335136_g_YuRenBaoZhuID) then
			local ImpactIndex = x335136_g_ImpactTable[1][random(x335136_g_ImpactCount)]	--���ѡ��Ч��
			bRet = LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, ImpactIndex, 0)		--����ӱ���Ч��
		elseif (itemIndex == 30501162) then --ʦͽ����
			local ImpactIndex = x335136_g_ImpactTable[2][random(x335136_g_ImpactCount)]	--���ѡ��Ч��
			bRet = LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, ImpactIndex, 0)		--����ӱ���Ч��
		end
	end
	
	if(bRet == 1) then --����ɹ�
		--zchw
		if (itemIndex == x335136_g_YuRenBaoZhuID) then
			 szMsg = format("�㱻%sʹ�������˱���", GetName(sceneId,selfId))
		elseif (itemIndex == 30501162) then --ʦͽ����
			 szMsg = format("�㱻%sʹ����ʦͽ����", GetName(sceneId,selfId))
		end	
		x335136_MsgBox( sceneId, targetId, szMsg )	--���Է���һ����Ϣ:�㱻XXXʹ�������˱���
	end
	
	return 1
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335136_OnActivateEachTick( sceneId, selfId)
	return 1
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x335136_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
