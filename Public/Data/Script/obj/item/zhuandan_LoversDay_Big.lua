--���ߣ����˽�����������ɾ��ºУ����<ID:30504049>
--�ű��� 889028
--Author:xiehong 2009-02-05

x889028_g_scriptId = 889028
x889028_g_Gift ={
									{id=30309187, count=2},
									{id=10124101, count=2},
									{id=10141804, count=1},
									{id=30504046, count=11}
								}

--**********************************
--�¼��������
--**********************************
function x889028_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889028_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889028_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889028_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 5 ) then
	  local strNotice = "�����ռ䲻��"
		x889028_ShowNotice( sceneId, selfId, strNotice)
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
function x889028_OnDeplete( sceneId, selfId )
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
function x889028_OnActivateOnce( sceneId, selfId )
	
	--����ͳ�ƣ�ת����ʹ��
	 LuaFnAuditZhuanDanUsed(sceneId, selfId, 27, 0)
	
	BeginAddItem( sceneId )
	for i, v in x889028_g_Gift do
			AddItem( sceneId, v.id, v.count )
	end
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return
	end

	--Ϊ��������ĸ���Ʒ
	AddItemListToHuman(sceneId,selfId)
	--��Ŀ��ʾ��Ϣ
	x889028_ShowNotice( sceneId, selfId, "�������#{_ITEM30309187}��#{_ITEM10124101}��#{_ITEM10141804}��#{_ITEM30504046}")
	
	--��Ч
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);

	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x889028_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889028_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

