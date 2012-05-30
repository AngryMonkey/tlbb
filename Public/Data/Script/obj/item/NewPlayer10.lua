--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:

------------------------------------------------------------------------------------------
--�������10����Ĭ�Ͻű�
--��ƷID: 30008055

--�ű���
x300079_g_scriptId = 300079--��ʱд���,�����õ�ʱ��һ��Ҫ��.

--��Ҫ�ĵȼ�
x300079_g_MinLevel = 10
x300079_g_Maxlevel = 20

--������Ʒ�б�
x300079_Gift ={30008056,10124141}


--**********************************
--�¼��������
--**********************************
function x300079_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300079_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300079_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300079_OnConditionCheck( sceneId, selfId )
	
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	
	--�Ƿ�ʹ�ù��õ���
	local bHave = GetMissionFlag(sceneId, selfId, MF_NEWPLAYER10_USED)
	if bHave == 1 then      --�Ѿ��μӹ���
		x300079_MsgBox(sceneId, selfId, "#{XRLB_81203_3}")
		return 0
	end
	
	--�ȼ�����
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	if CurLevel>=x300079_g_Maxlevel then
		x300079_MsgBox(sceneId, selfId, "#{XRLB_81203_4}")
		return 0
	end

	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	   local strNotice = "#{XRLB_81203_5}1#{XRLB_81203_6}"
		 x300079_MsgBox( sceneId, selfId, strNotice)
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
function x300079_OnDeplete( sceneId, selfId )
	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		local guid = LuaFnObjId2Guid(sceneId, selfId);
		
		if guid ~= nil then
			--local LogInfo = format("0X%08X,", guid);
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_TSLB10, guid);
		end
		
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
function x300079_OnActivateOnce( sceneId, selfId )
	BeginAddItem( sceneId )
	for i, v in x300079_Gift do
			AddItem( sceneId, v, 1 )
	end
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return 
	end

	--Ϊ����������������20������ʱװ����������
	AddItemListToHuman(sceneId,selfId)
	SetMissionFlag(sceneId, selfId, MF_NEWPLAYER10_USED, 1)
	x300079_MsgBox( sceneId, selfId, "#{XRLB_81203_7}#{_ITEM30008055}#{XRLB_81203_8}")
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300079_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--**********************************
--��Ŀ��Ϣ��ʾ
--**********************************
function x300079_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
