--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--Public\Data\Script\obj\commonitem\speaker.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�
--С����
--�ű���
x330003_g_ScriptId	= 330003

--Ч����ID
x330003_g_Impact		= -1	--ʹ��һ���ض�����Ч���

--����ֵ����
x330003_g_WGCResult	=
{
	["SUC_SEND"]			= 36,		--С���ȷ��ͳɹ�
	["FAL_SEND"]			= 37,		--С���ȷ���ʧ�ܣ�δ֪
	["FAL_FULL"]			= 38,		--С���ȷ���ʧ�ܣ���Ϣ������
}


x330003_g_itemTabIdxList = { 30505107, 30505219 }

--**********************************
--�¼��������
--**********************************
function x330003_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x330003_IsSkillLikeScript( sceneId, selfId )
	return 1	 --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x330003_CancelImpacts( sceneId, selfId )
	return 0	 --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x330003_OnConditionCheck( sceneId, selfId )

	--�����е�λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--�����Ʒ�Ƿ����
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x330003_MsgBox( sceneId, selfId, "����Ʒ�ѱ�������" )
		return 0
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
function x330003_OnDeplete( sceneId, selfId )
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
function x330003_OnActivateOnce( sceneId, selfId )

	if( -1 ~= x330003_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x330003_g_Impact, 0 )
	end
	
	--�����е�λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	--���з��ͽ���
	BeginUICommand( sceneId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 5422 )
	return 1

end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x330003_OnActivateEachTick( sceneId, selfId )
	return 1	 --���������Խű�, ֻ�����պ�����
end

--**********************************
--C++�ص��ӿڣ��Ͻ�Client���У�
--С���ȷ���ǰ���
--**********************************
function x330003_CallBackSpeakerBefore( sceneId, selfId )

	--��ȡ��ƷID
	local ItemIndex = 0
	if LuaFnGetAvailableItemCount( sceneId, selfId, x330003_g_itemTabIdxList[2] ) > 0 then
		ItemIndex = x330003_g_itemTabIdxList[2]
		SetMissionData( sceneId, selfId, MD_SPEAKER_STATE, x330003_g_itemTabIdxList[2] )		
	else
		ItemIndex = x330003_g_itemTabIdxList[1]
		SetMissionData( sceneId, selfId, MD_SPEAKER_STATE, x330003_g_itemTabIdxList[1] )
	end
			
	local	itmId	= ItemIndex;
	if itmId <= 0 then
		x330003_MsgBox( sceneId, selfId, "���Ĺ㲥Ƶ�ʹ��죡" )
		return 0
	end
	if LuaFnDelAvailableItem( sceneId, selfId, itmId, 1 ) == 0 then
		x330003_MsgBox( sceneId, selfId, "û�д���Ʒ������Ʒ�޷�ʹ�û򱻼�����" )
		return 0
	end

	return 1
end

--**********************************
--C++�ص��ӿڣ��Ͻ�Client���У�
--С���ȷ����󷵻�
--**********************************
function x330003_CallBackSpeakerAfter( sceneId, selfId, retType, retParam )

	--��ȡ��ƷID
	local ItemIndex = GetMissionData( sceneId, selfId, MD_SPEAKER_STATE )

	local ItemId = 0
	for i, ItemTabIdx in x330003_g_itemTabIdxList do
		if ItemIndex == ItemTabIdx then
			ItemId = ItemIndex
			break
		end
	end
	local	itmId	= ItemId;
	if itmId <= 0 then
		return 0
	end

	if retType == x330003_g_WGCResult["SUC_SEND"] then
		if retParam > 0 then
			nMin		= floor( retParam / 60 )
			nSec		= mod( retParam, 60 )
			szTim		= nil
			if nMin > 0 then
				szTim	= nMin.."����"..nSec.."��"
			else
				szTim	= nSec.."��"
			end
			x330003_MsgBox( sceneId, selfId, "С���ȷ��ͳɹ�������Լ��Ҫ�ȴ�"..szTim.."��" )
		else
			x330003_MsgBox( sceneId, selfId, "С���ȷ��ͳɹ���" )
		end
	elseif retType == x330003_g_WGCResult["FAL_SEND"] then
		x330003_MsgBox( sceneId, selfId, "С���ȷ���ʧ�ܣ�" )
	elseif retType == x330003_g_WGCResult["FAL_FULL"] then
		x330003_MsgBox( sceneId, selfId, "С������Ϣ����������30���Ӻ����ԣ�" )
		TryRecieveItem( sceneId, selfId, itmId, QUALITY_CREATE_DEFAULT )
	end

	return 1
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x330003_MsgBox( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
