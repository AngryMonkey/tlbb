--����NPC
--����
--��ͨ

x077011_g_ScriptId	= 077011

--������
x077011_g_Key				=
{
	["dlg"]	= 10,	--�������Ķ���
	["out"]	= 11,	--��Ҫ��ȥ
	["sn0"]	= 0,	--ȥ����
	["sn1"]	= 1,	--ȥ����
	["sn2"]	= 2,	--ȥ����
}

--������������Сɱ��ֵ
x077011_g_PKMinVal	= 8--[tx43640]��4��Ϊ8

--**********************************
--�¼��������
--**********************************
function x077011_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
			AddText(sceneId, "#{PRISON_081120_01}")
			AddNumText( sceneId, x077011_g_ScriptId, "��Ҫ��ȥ", 9, x077011_g_Key["out"] )
			AddNumText( sceneId, x077011_g_ScriptId, "�������Ķ���", 11, x077011_g_Key["dlg"] )
			AddNumText( sceneId, x077011_g_ScriptId, "��Ҫ��ԩ", 9, 21 )
			AddNumText( sceneId, x077011_g_ScriptId, "����������", 9, 15 )
			AddNumText( sceneId, x077011_g_ScriptId, "ʲô����ԩ��", 11, 22 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x077011_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	local	val	= LuaFnGetHumanPKValue( sceneId, selfId )	--ɱ��ֵ
	
	if key == 15 then
		
				
		local nItemCount = GetItemCount(sceneId, selfId, 30008019);
		if nItemCount <= 0 then
			x077011_MsgBox( sceneId, selfId, targetId, "#{TeSheLing_00}" )
			return 0;
		end
		
		if IsWaiGuaUser( sceneId, selfId ) > 0 then
			x077011_MsgBox( sceneId, selfId, targetId, "����Ϊʹ����ұ�ץ������������޷�ʹ�������" )
			return 0;
		end
		
		local bRet = 0;
		
		local	bagpos = GetItemBagPos( sceneId, selfId, 30008019, 0 )
	
		if LuaFnLockCheck( sceneId, selfId, bagpos, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "����Ʒ�ѱ�������" )
				return 0;
			end
		end

		bRet = 1;
		
		if bRet > 0 then
			BeginEvent( sceneId )
				AddText( sceneId, "  ��ϲ�㣬�����ڿ��Գ�ȥ�ˣ��ǵó�ȥ֮����Ī����ɱ�޹����������ǲ�������ģ�����ȥ�ĸ����У�" )
				AddNumText( sceneId, x077011_g_ScriptId, "����", 9, 3 )
				AddNumText( sceneId, x077011_g_ScriptId, "����", 9, 4 )
				AddNumText( sceneId, x077011_g_ScriptId, "����", 9, 5 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			
			
		end
		
		return 0;
	end
	
	if key == 21 then
		x077011_ShenYuan( sceneId, selfId, targetId )
		return 0
	elseif key == 22 then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_00}" )
		return 0
	end
	
	--�������Ķ���
	if key == x077011_g_Key["dlg"]	then
			x077011_MsgBox( sceneId, selfId, targetId, "#{function_help_087}" )
			return 0

	--��Ҫ��ȥ
	elseif key == x077011_g_Key["out"] then
		if val > x077011_g_PKMinVal then
			x077011_MsgBox( sceneId, selfId, targetId, "  �����ڵ�ɱ��Ϊ"..val.."��ֻ��С�ڵ���"..x077011_g_PKMinVal.."���ʱ����ܳ�ȥ��" )
			return 0
		end

		BeginEvent( sceneId )
			AddText( sceneId, "  ��ϲ�㣬�����ڿ��Գ�ȥ�ˣ��ǵó�ȥ֮����Ī����ɱ�޹����������ǲ�������ģ�����ȥ�ĸ����У�" )
			AddNumText( sceneId, x077011_g_ScriptId, "����", 9, x077011_g_Key["sn0"] )
			AddNumText( sceneId, x077011_g_ScriptId, "����", 9, x077011_g_Key["sn1"] )
			AddNumText( sceneId, x077011_g_ScriptId, "����", 9, x077011_g_Key["sn2"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--ȥ����
	elseif key == x077011_g_Key["sn0"] then
		--����
		PrisonGoOut( sceneId, selfId )
		--�س�
		NewWorld( sceneId, selfId, 0, 230, 321 )

	--ȥ����
	elseif key == x077011_g_Key["sn1"] then
		--����
		PrisonGoOut( sceneId, selfId )
		--�س�
		NewWorld( sceneId, selfId, 1, 203,258 )

	--ȥ����
	elseif key == x077011_g_Key["sn2"] then
		--����
		PrisonGoOut( sceneId, selfId )
		--�س�
		NewWorld( sceneId, selfId, 2, 375, 227 )
	
	elseif key == 3 then
			
		local	bagpos1 = GetItemBagPos( sceneId, selfId, 30008019, 0 )
		if LuaFnLockCheck( sceneId, selfId, bagpos1, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "����Ʒ�ѱ�������" )
				return 0;
			end
		end
	
		--����
		PrisonGoOut( sceneId, selfId )
		--�س�
		NewWorld( sceneId, selfId, 0, 132, 183 )
		
		LuaFnDelAvailableItem(sceneId, selfId, 30008019, 1);

	elseif key == 4 then
	
		local	bagpos2 = GetItemBagPos( sceneId, selfId, 30008019, 0 )
		if LuaFnLockCheck( sceneId, selfId, bagpos2, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "����Ʒ�ѱ�������" )
				return 0;
			end
		end
	
		--����
		PrisonGoOut( sceneId, selfId )
		--�س�
		NewWorld( sceneId, selfId, 1, 114,162 )
		
		LuaFnDelAvailableItem(sceneId, selfId, 30008019, 1);

	elseif key == 5 then
	
		local	bagpos3 = GetItemBagPos( sceneId, selfId, 30008019, 0 )
		if LuaFnLockCheck( sceneId, selfId, bagpos3, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "����Ʒ�ѱ�������" )
				return 0;
			end
		end
	
		--����
		PrisonGoOut( sceneId, selfId )
		--�س�
		NewWorld( sceneId, selfId, 2, 241, 138 )
		
		LuaFnDelAvailableItem(sceneId, selfId, 30008019, 1);

	end
	
	if val > x077011_g_PKMinVal then --[tx43640]ԭΪ>= 5��Ӧ��Ϊ>x077011_g_PKMinVal,��ʵӦ����[8,10]�е�һ��ֵ 
		LuaFnSetHumanPKValue(sceneId, selfId, x077011_g_PKMinVal)--[tx43640]ԭΪ4��Ӧ��Ϊx077011_g_PKMinVal
		
		-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
		local LogInfo	= format( "[ChangePKValue]:Prison sceneId=%d, GUID=%0X, PKValueBgn=%d, PKValueEnd=%d",
				sceneId,
				LuaFnObjId2Guid( sceneId, selfId ),			
				val,
				LuaFnGetHumanPKValue(sceneId, selfId) )
		WriteCheckLog( sceneId, selfId, LogInfo )
		
	end
	
	return 1

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x077011_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end


--**********************************
--��ԩ
--**********************************
function x077011_ShenYuan( sceneId, selfId, targetId )

	--�ж�ɱ��....
	if LuaFnGetHumanPKValue( sceneId, selfId ) > x077011_g_PKMinVal then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_01}" )
		return
	end
	
	--�жϵ�ǰ�Ƿ��ֹ��ԩ....
	if GetMissionFlag( sceneId, selfId, MF_CannotPrisonShenyuan ) == 1 then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_02}" )
		return
	end
	
	--�жϽ����Ƿ��Ѿ��ù���ԩ��....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_PRISON_SHENYUAN_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_03}" )
		return
	end
	
	--���ý����Ѿ��ù���ԩ��....
	SetMissionData( sceneId, selfId, MD_PRISON_SHENYUAN_DAYTIME, CurDayTime )
	
	--����ͼ����֤����һش�����....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	LuaFnSendGuajiQuestion( sceneId, selfId )

end

