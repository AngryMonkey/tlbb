--��Ϸ�Ż

--�ű���
x808005_g_ScriptId			= 808005
x808005_g_ScriptId_Ctrl	= 808006	--�ص��ű�

x808005_g_PrizeBase			= 8000		--��ô󽱵ļ��ʻ���
x808005_g_PrizeMoney		= 1000		--��Ǯ����
x808005_g_Prize0				= 10141041--����
x808005_g_Prize1				= 30308024--����
x808005_g_RoundMax			= 50			--һ���п�����ȡ�������

--������
x808005_g_Key	=
{
	["chg"]			= 100,		--�ύ���ޣ��һ�����
	["inf"]			= 101,		--����
}

--�ִ���
x808005_g_Str	=
{
	--������ת���ַ����ִ�
	["inf2"]		= "  #W����ֻҪ�ύ���ޱ������ɣ����ڳԵ���˹����������Я����ָ��ʳƷ�������ѡһ����",
	["ful"]			= "  ��Ĳ�����˼����������Ϊ��������ô������ޱ�����ʳƷ������߲���Ѿ����ˡ���ӭ�´������ҡ�",
	["bty1"]		= "  #Wлл���ṩ�����޺�ʳƷ���������ҵ�һ��С��˼�����������¡�",
	["bty2"]		= "  #Wлл��Ϊ��������ô������飬������һͷ�����һ���������ѧϰ��˴�����鱾����һ�������ˡ����������ǹ������ر��ܵ����صģ�����һ��Ҫ�ƴ�����#r  #G���������֮ǰһ��Ҫ�ǵ���ѧϰ�����˴���ķ���#W��",

	--����ת���ַ����ִ�
	["inf1"]		= "  #Wÿ�ܵ��ܶ��������������ޱ�����ʳ��������˹��ÿ�ν����ޱ�����ʱ����˹Ҳ���������Я����ָ��ʳ������ȡһ����ÿ����һ��������һ��ʳ�ｫ����#{_MONEY"..x808005_g_PrizeMoney.."}��������һ�����ʽ���������˫�����#G����#W��",
	["inf_pet"]	= "  #W��˹�չ������ޱ����У�#r  #G%s#W��",
	["inf_itm"]	= "  #W������ǵã��ڴ���������ͬʱ�ǵô����µ�ʳƷ����һ����������˹����ܾ��������ޱ�����#r  #W��˹��Ҫ��ʳƷ�У�#r  #G%s#W��",
	["ned_pet"]	= "  #W��ֻ��Ҫ���µ���Щ������#r  #G%s#W��",
	["ned_itm"]	= "  #W�����ҵ����ޱ����Ƕ��ˣ������һ���Ҫ��������һ�ֵ�ʳƷ��#r  #G%s#W��",
	["msg_bty"]	= "#R#{_INFOUSR%s}������Ϸ��ʹ�ߵ����ޱ�����ʳ�������Ϊ���ͣ���Ϊ�����������#{_INFOUSR%s}һͷ#{_INFOMSG%s}��һ����˼����顣",
}

--���޼�
x808005_g_Pet	=
{
	[1]	= { id = 3099, name = "���汦��" },
	[2]	= { id = 3129, name = "���㱦��" },
	[3]	= { id = 3109, name = "���𱦱�" },
	[4]	= { id = 3119, name = "����뱦��" },
	[5]	= { id = 3139, name = "èͷӥ����" },
	[6]	= { id = 3149, name = "⵱���" },
	[7]	= { id = 3159, name = "�ϻ�����" },
	[8]	= { id = 3169, name = "Ұ����" },
}

--��Ʒ��
x808005_g_Itm	=
{
	[1]	= { id = 30101064, name = "������" },
	[2]	= { id = 30101054, name = "���" },
	[3]	= { id = 30101065, name = "������" },
	[4]	= { id = 30101055, name = "Ŵ�׸�" },
	[5]	= { id = 30101066, name = "�Ž��" },
	[6]	= { id = 30101056, name = "�㹽�˰�" },
	[7]	= { id = 30101084, name = "������" },
	[8]	= { id = 30101074, name = "��֭��Ƭ" },
	[9]	= { id = 30101085, name = "��������" },
	[10]= { id = 30101075, name = "��������" },
	[11]= { id = 30101086, name = "����Ѽ��" },
	[12]= { id = 30101076, name = "����������" },
}

--**********************************
--������ں���
--**********************************
function x808005_OnDefaultEvent( sceneId, selfId, targetId )

	--ѡ��ť
	local	key	= GetNumText()

	--�ύ���޺�ʳ��
	if key == x808005_g_Key["chg"] then
		if CallScriptFunction( x808005_g_ScriptId_Ctrl, "IsActivityDoing", sceneId ) == 1 then
			--�����޽���
			str_1	= format( "  #W��ֻ��Ҫ������Щ������#r  #G%s#W��", x808005_MyGetBuyList( 0 ) )
			str_2	= format( "  #W�Լ�������Щʳ�#r  #G%s#W��", x808005_MyGetBuyList( 1 ) )
			BeginEvent( sceneId )
				AddText( sceneId, str_1 )
				AddText( sceneId, str_2 )
			EndEvent( sceneId )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x808005_g_ScriptId, -1, 2 )
		else
			x808005_MyNotifyTip( sceneId, selfId, "���ڲ��ǻʱ�䣡" )
		end

	--����
	elseif key == x808005_g_Key["inf"] then
		str_1	= format( x808005_g_Str["inf_pet"], x808005_MyGetBuyList( 0 ) )
		str_2	= format( x808005_g_Str["inf_itm"], x808005_MyGetBuyList( 1 ) )
		BeginEvent( sceneId )
			AddText( sceneId, x808005_g_Str["inf1"] )
			if str_1 ~= nil then
				AddText( sceneId, str_1 )
			end
			if str_2 ~= nil then
				AddText( sceneId, str_2 )
			end
			AddText( sceneId, x808005_g_Str["inf2"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

end

--**********************************
--�о��¼�
--**********************************
function x808005_OnEnumerate( sceneId, selfId, targetId )

	if CallScriptFunction( x808005_g_ScriptId_Ctrl, "IsActivityDoing", sceneId ) == 1 then
		AddNumText( sceneId, x808005_g_ScriptId, "����������Ҫ�����ޱ���", 6, x808005_g_Key["chg"] )
	end
	AddNumText( sceneId, x808005_g_ScriptId, "������Ϸ�Ż", 11, x808005_g_Key["inf"] )

end

--**********************************
--�����
--**********************************
function x808005_MyOnBounty( sceneId, selfId, targetId, indexitm, indexpet )

	local	num_chg	= 0
	local	num_bty	= 0
	
	--����Ļ�������
	--100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
	--begin modified by zhangguoxin 090207
	local iDayCount	= GetMissionData( sceneId, selfId, MD_CIRCUS_DAYCOUNT )
	if iDayCount == nil or iDayCount < 0 then
		iDayCount			= 0
	end
	local iTime			= iDayCount - floor( iDayCount/100000 ) * 100000
	--local iDayTime	= floor( iTime/100 )									--��һ�ν�����������ʱ��(����)
	local iDayTime	= iTime																	--��һ�ν�����������ʱ��(����)
	--local iQuaTime	= iTime - floor( iTime/100 ) * 100			--��һ�ν�����������ʱ��(��)
	local iDayHuan	= floor( iDayCount/100000 )							--��������ɵ��������
	--local CurTime		= GetHourTime()													--��ǰʱ��
	--local CurDaytime= floor( CurTime/100 )									--��ǰʱ��(��)
	local CurDaytime = GetDayTime()														--��ǰʱ��(��)
	--local CurQuaTime = CurTime - floor( CurTime/100 ) * 100	--��ǰʱ��(��)
	
	--�ϴ����������ͬһ����
	if CurDaytime == iDayTime then
		iDayHuan			= iDayHuan + 1
		--iQuarterTime	= CurQuaTime
	--�ϴ����������ͬһ�죬����
	else
		iDayTime			= CurDaytime
		iQuarterTime	= 0
		iDayHuan			= 0
	end
	if iDayHuan > x808005_g_RoundMax then
		x808005_MyMsgBox( sceneId, selfId, targetId, x808005_g_Str["ful"] )
		return 0
	else
		--iDayCount			= iDayHuan * 100000 + iDayTime * 100 + iQuarterTime
		iDayCount			= iDayHuan * 100000 + iDayTime;
	end
	--end modified by zhangguoxin 090207
	
	--Ҫ�ڱ�֤���ޡ���Ʒ�ύ����ȷ�������£��ٽ�����һɾ��
	if indexpet < 0 or indexpet >= 255 or LuaFnIsPetAvailable( sceneId, selfId, indexpet ) ~= 1 then
		x808005_MyNotifyTip( sceneId, selfId, "��Ч���ޣ�" )
		return 0
	end
	if indexitm < 0 or indexitm >= 255 or LuaFnIsItemAvailable( sceneId, selfId, indexitm ) ~= 1 then
		x808005_MyNotifyTip( sceneId, selfId, "��Чʳ�" )
		return 0
	end
	--����Ƿ�����������
	local	pet_id		= LuaFnGetPet_DataID( sceneId, selfId, indexpet )
	local	pet_ret		= 0
	local	pet_unt
	for i = 1, getn( x808005_g_Pet ) do
		pet_unt				= x808005_g_Pet[ i ]
		if pet_id == pet_unt.id then
			pet_ret			= 1
			break
		end
	end
	if pet_ret ~= 1 then
		str	= format( x808005_g_Str["ned_pet"], x808005_MyGetBuyList( 0 ) )
		x808005_MyMsgBox( sceneId, selfId, targetId, str )
		return 0
	end
	--����Ƿ���������Ʒ
	local	itm_id		= LuaFnGetItemTableIndexByIndex( sceneId, selfId, indexitm )
	local	itm_ret		= 0
	local	itm_unt
	for i = 1, getn( x808005_g_Itm ) do
		itm_unt				= x808005_g_Itm[ i ]
		if itm_id == itm_unt.id then
			itm_ret			= 1
			break
		end
	end
	if itm_ret ~= 1 then
		str	= format( x808005_g_Str["ned_itm"], x808005_MyGetBuyList( 1 ) )
		x808005_MyMsgBox( sceneId, selfId, targetId, str )
		return 0
	end

	--�����ύ
	if LuaFnDeletePet( sceneId, selfId, indexpet, 1 ) > 0 then
		x808005_MyNotifyTip( sceneId, selfId, "���ύ��һֻ"..pet_unt.name.."��" )
	else
		return 0
	end
	--��Ʒ�ύ
	if HaveItemInBag( sceneId, selfId, itm_id ) > 0 and
		LuaFnGetAvailableItemCount( sceneId, selfId, itm_id ) >= 1 and
		DelItem( sceneId, selfId, itm_id, 1 ) > 0 then
		x808005_MyNotifyTip( sceneId, selfId, "���ύ��һ��"..itm_unt.name.."��" )
	else
		return 0
	end

	if pet_ret == 1 and itm_ret == 1 then
		--�ɹ��һ�һ�Σ�����������
		num_chg			= CallScriptFunction( x808005_g_ScriptId_Ctrl, "OnSuccChange", sceneId )
		--Ǯ����
		AddMoney( sceneId, selfId, x808005_g_PrizeMoney )
		--�ɹ��ͳ�
		x808005_MyMsgBox( sceneId, selfId, targetId, x808005_g_Str["bty1"] )
		--�ɹ��ͳ������û���
		SetMissionData( sceneId, selfId, MD_CIRCUS_DAYCOUNT, iDayCount )
		--Add Log
		LogInfo			= format( "[CIRCUS]: x808005_MyOnBounty( sceneId=%d, GUID=%0X ), pet=%d, itm=%d, num_chg=%d, num_bty=%d, PRIZE_MONEY(%d)",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			pet_id, itm_id, num_chg, num_bty, x808005_g_PrizeMoney )
		MissionLog( sceneId, LogInfo )
	else
		return 0
	end

	--�����ʽ���
	if random( x808005_g_PrizeBase ) == 1 and LuaFnGetPropertyBagSpace( sceneId, selfId ) >= 2 then
		--�ɹ���һ�Σ�����������
		num_bty			= CallScriptFunction( x808005_g_ScriptId_Ctrl, "OnSuccPrize", sceneId )
		if num_bty > 0 then
			local	idBag0	= LuaFnTryRecieveItem( sceneId, selfId, x808005_g_Prize0, 1 )	--����
			local	idBag1	= LuaFnTryRecieveItem( sceneId, selfId, x808005_g_Prize1, 1 )	--����
			local	szTran
			if idBag0 >= 0 and idBag1 >= 0 then
				szTran			= GetBagItemTransfer( sceneId, selfId, idBag0 )
				--�ɹ��ͳ�
				x808005_MyMsgBox( sceneId, selfId, targetId, x808005_g_Str["bty2"] )
				if szTran ~= nil then
					str				= format( x808005_g_Str["msg_bty"], GetName( sceneId, selfId ), GetName( sceneId, selfId ), szTran )
					x808005_MyGlobalNews( sceneId, str )
				end
				--Add Log
				LogInfo			= format( "[CIRCUS]: x808005_MyOnBounty( sceneId=%d, GUID=%0X ), pet=%d, itm=%d, num_chg=%d, num_bty=%d, PRIZE_ITEM(%d,%d)",
					sceneId,
					LuaFnObjId2Guid( sceneId, selfId ),
					pet_id, itm_id, num_chg, num_bty, x808005_g_Prize0, x808005_g_Prize1 )
				MissionLog( sceneId, LogInfo )
			end
		end
	end
	return 1

end

--**********************************
--����ύ���޺�Ļص�����
--**********************************
function x808005_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )

	if indexpet >= 255 then
		--����ֵ����255��ʾ�գ�û�ύ����
		x808005_MyNotifyTip( sceneId, selfId, "��������϶��������У�" )
	elseif index1 < 0 or index1 >= 255 then
		x808005_MyNotifyTip( sceneId, selfId, "���ʳ���϶�����һ����Ʒ���У�" )
	else
		x808005_MyOnBounty( sceneId, selfId, npcid, index1, indexpet )
	end

end

--**********************************
--��ȡ�չ��б�
--**********************************
function x808005_MyGetBuyList( type )

	local	str	= ""
	local	lst
	if type == 0 then
		lst			= x808005_g_Pet
	else
		lst			= x808005_g_Itm
	end

	for i = 1, getn( lst ) do
		if i ~= 1 then
			str		= str..", "
		end
		str		= str..lst[i].name
	end
	return str

end

--**********************************
--�Ի�����ʾ
--**********************************
function x808005_MyMsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x808005_MyNotifyTip( sceneId, selfId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--ȫ�򹫸�
--**********************************
function x808005_MyGlobalNews( sceneId, str )

	if str == nil then
		return
	end
	AddGlobalCountNews( sceneId, str )

end
