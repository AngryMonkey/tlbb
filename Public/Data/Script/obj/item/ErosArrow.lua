--���˽ڻ

--����֮��ʹ�ýű�


--�ű���
x300071_g_scriptId = 300071

--���ʹ�ô���
x300071_UseMaxCount = 3

--**********************************
--�¼��������
--**********************************
function x300071_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300071_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300071_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300071_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 0
	end

	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--��������....

			--���ܶ��Լ�ʹ��....
		if selfId == targetId then
			x300071_MsgBox( sceneId, selfId, "#{QRJ_81009_19}" )
			return 0
		end
		
			--�ж����˵��Ա�
			
		if (LuaFnGetSex(sceneId,selfId) == LuaFnGetSex(sceneId,targetId)) then
			x300071_MsgBox( sceneId, selfId, "#{QRJ_81009_20}")
			return 0
		end
	
	else
		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
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
function x300071_OnDeplete( sceneId, selfId )
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x300071_OnActivateOnce( sceneId, selfId )
	
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 1
	end
	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--������������....
		
			--�����е�λ��
		local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
		if bagId < 0 then
			return 1
		end 
			--�����Ʒ�Ƿ����
		if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
			x300071_MsgBox( sceneId, selfId, "����Ʒ�ѱ�������" )
			return 1
		end
		
		local	CurUseCount			--����֮����ʣ��ʹ�ô���
		CurUseCount		= GetBagItemParam( sceneId, selfId, bagId, 8, 2 )	--��ȡʣ��ʹ�ô���	
		if(CurUseCount == 0)then	--��һ��ʹ��
			CurUseCount = x300071_UseMaxCount		
		end
		
		if (CurUseCount>0) then
			CurUseCount = CurUseCount - 1
			if(CurUseCount <= 0) then
				local ret = EraseItem( sceneId, selfId, bagId )		
				if ret ~= 1 then
					return 0--ɾ��ʧ��
				end
			end
			--����һ������
			SetBagItemParam( sceneId, selfId, bagId, 4, 2, x300071_UseMaxCount )--�������ʹ�ô���
			SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurUseCount )--���滹����ʹ�ô���
			
			--ˢ��Client�˵ı�����Ʒ��Ϣ
			LuaFnRefreshItemInfo( sceneId, selfId, bagId )
			
			LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 74, 1500) 
			x300071_MsgBox( sceneId, targetId, LuaFnGetName(sceneId,selfId).."#{QRJ_81009_22}" )
		end 
		
	else

		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
		return 1

	end



	return 1;

end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300071_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x300071_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
