--װ�����

--�ű���
x311200_g_ScriptId	= 311200

x311200_Stiletto_four_ID = {
                                                                                                10141040,10156001,10156002,10156003,10156004,
														10514091,10514092,10514093,10514094,10514095,10514096,10514097,10514098,10515090,10515091,
														10515092,10515093,10515094,10515095,10515096,10515097,10515098,10521090,10521091,10521092,
														10521093,10521094,10521095,10521096,10521097,10521098,10522090,10522091,10522092,10522093,
														10522094,10522095,10522096,10522097,10522098,10523090,10523091,10523092,10523093,10523094,
														10523095,10523096,10523097,10523098,10514090,
														-- ����΢��2008.6.12�����102�������޴��
														10300100,10300101,10300102, 10301100,10301101,10301102, 10301200,10301201,10301202, 
														10302100,10302101,10302102, 10303100,10303101,10303102, 10303200,10303201,10303202,
														10304100,10304101,10304102, 10305100,10305101,10305102, 10305200,10305201,10305202,
														10422016,10423024,
														--������2008.8.29����100�ף�����ף�����96�׿��ż��޴��
														10510009,10510019,10510029,10510039,10510049,10510059,10510069,10510079,10510089,10511009,
														10511019,10511029,10511039,10511049,10511059,10511069,10511079,10511089,10512009,10512019,
														10512029,10512039,10512049,10512059,10512069,10512079,10512089,10513009,10513019,10513029,
														10513039,10513049,10513059,10513069,10513079,10513089,10511096,10512092,10520092,10522101,
														10523101,10511097,10512093,10520093,10522102,10523102,10511098,10512094,10520094,10522103,
														10523103,10511099,10512095,10520095,10522104,10523104,
														--������2008.9.18��90�����ϣ���90������ܲ����Ľ�ָ���������翪�ż��޴��
														10215020,10222020,10223020,10222035,10222036,10223035,10223036,
														--������2008.11.11��90�����ϣ���90���ֹ�װ�����ż��޴�ף�Ь���������������ף�ͷ�������������ף�������
														10200019,10200020,10201019,10201020,10202019,10202020,10203019,10203020,10204019,10204020,
														10205019,10205020,10210020,10210040,10210060,10213020,10213040,10213060,10212020,10212040,
														10212060,10211020,10211040,10211060,10214020,10221020,10220020,
														--zchw��2008-11-17  TT��41140 90�����ף�92���������ŵ��Ŀ�													
														10510008,10510038,10510068,
														10511018,10511028,10511048,10511058,10511078,10511088,10512008,10512038,
														10512068,10513008,10513018,10513028,10513038,10513048,10513058,10513068,
														10513078,10513088,10514028,10514058,10514088,10520018,10520028,10520048,
														10520058,10520078,10520088,10521028,10521058,10521088,10522018,10522048,
														10522078,10552008,10552038,10552068,10553008,10553018,10553038,10553048,
														10553068,10553078,
														--zchw 2008-11-26 TT��41771
														10410026, 10410027, 10410034, 10410035, 10423025, 10423026,
														--houzhifang 2008-12-22: dark
														10150001,10150002,
														
													}
																
function x311200_OnStiletto( sceneId, selfId, idBagPos, idBagPosStuff )

	--�ɴ�׵�װ��
	--0������1ñ�ӣ�2�·���3���ף�4Ь
	--5������6��ָ��7������12������14����
	--15����
	local	tEquipGemTable	= { 0, 1, 2, 3, 4, 5, 6, 7, 10, 12, 14, 15, 17 ,18 }

	local	Bore_Count			= GetBagGemCount( sceneId, selfId, idBagPos )
	local nLevel					= GetBagItemLevel( sceneId, selfId, idBagPos )
	local EquipType				= LuaFnGetBagEquipType( sceneId, selfId, idBagPos )
	local find						= 0

	for i, gem in tEquipGemTable do
		if gem == EquipType then
			find							= 1
		end
	end
	if find == 0 then
		x311200_NotifyTip( sceneId, selfId, "��װ�����ܴ�ס�" )
		return
	end
	
	-- ����΢��2008.6.2����Ʒװ���ų�����¥��10422016����¥��10423024���ܴ��
	-- ����΢��2008.7.1����¥�䡢��¥��Ļ����޸ģ�1�����Դ�ף�2��������Ƕ��ʯ����ֻ����Ƕ���󶨵ı�ʯ
	--local itemID = GetItemTableIndexByIndex(sceneId, selfId, idBagPos )
	--if itemID == 10422016 or itemID == 10423024 then
	--	x311200_NotifyTip( sceneId, selfId, "��װ�����ܴ�ס�" )
	--	return
	-- end
	

	--�������
	ret	= LuaFnStilettoCostExe( sceneId, selfId, nLevel*100+1+Bore_Count, idBagPosStuff, 1 )
	if ret == -1 then
		x311200_NotifyTip( sceneId, selfId, "���������ʲ߻���" )
		return
	elseif ret == -2 then
		x311200_NotifyTip( sceneId, selfId, "��û�к��ʵĲ��ϣ��޷����д˲�����" )
		return
	elseif ret == -3 then
		x311200_NotifyTip( sceneId, selfId, "��û���㹻�Ľ�Ǯ���޷����д˲�����" )
		return
	elseif ret == -4 then
		x311200_NotifyTip( sceneId, selfId, "��û���㹻�Ĳ��ϣ��޷����д˲�����" )
		return
	elseif ret == 0 then
		x311200_NotifyTip( sceneId, selfId, "��Ǯʧ�ܣ�" );
		return
	end

	--���ִ��
	--����Ҫ��
	ret	= AddBagItemSlot( sceneId, selfId, idBagPos )
	if ret == -1 then
		x311200_NotifyTip( sceneId, selfId, "װ�����ʧ��" )
	elseif ret == -2 then
		x311200_NotifyTip( sceneId, selfId, "���ش���" )
	elseif ret == -3 then
		x311200_NotifyTip( sceneId, selfId, "��Ҫ����һ��װ��" )
	elseif ret == -4 then
		x311200_NotifyTip( sceneId, selfId, "�˴�ֻ�ܴ�ǰ3����" ) --modi:lby2008-5-21�������ͼ����ĸ��յ�ʱ�򱨴�
		--x311200_NotifyTip( sceneId, selfId, "�����ٴ����" ) 
	elseif ret == 1 then
		x311200_NotifyTip( sceneId, selfId, "װ����׳ɹ�" )
		--������Ч
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
	end


end

--**********************************
--��Ŀ��ʾ
--**********************************
function x311200_NotifyTip( sceneId, selfId, Msg )

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

																
--add:lby20080523��¥�ϴ���ĸ���
function x311200_OnStiletto_Four( sceneId, selfId, idBagPos, idBagPosStuff, type )

	--�ɴ�׵�װ��
	--0������1ñ�ӣ�2�·���3���ף�4Ь
	--5������6��ָ��7������12������14����
	--15����
	

	--x311200_NotifyTip( sceneId, selfId, "test11" )
	
	local taozhuangid = GetItemTableIndexByIndex( sceneId, selfId, idBagPos )
	local slotcailiao = GetItemTableIndexByIndex( sceneId, selfId, idBagPosStuff )
	
	local szCailiao = GetBagItemTransfer(sceneId,selfId, idBagPosStuff)
	
	--װ���Ƿ��ǰ�
	local isequipbind = LuaFnGetItemBindStatus( sceneId, selfId, idBagPos )
	--�����Ƿ��ǰ�
	local isstuffbind = LuaFnGetItemBindStatus( sceneId, selfId, idBagPosStuff )
	--PrintStr("isequipbind "..isequipbind.." isstuffbind "..isstuffbind)
	
	-- ����΢��2008.6.2����Ʒװ���ų�����¥��10422016����¥��10423024���ܴ��
	-- ����΢��2008.7.1����¥�䡢��¥��Ļ����޸ģ�1�����Դ�ף�2��������Ƕ��ʯ����ֻ����Ƕ���󶨵ı�ʯ
	--local itemID = GetItemTableIndexByIndex(sceneId, selfId, idBagPos )
	--if itemID == 10422016 or itemID == 10423024 then
	--	x311200_NotifyTip( sceneId, selfId, "��װ�����ܴ�ס�" )
	--	return
	--end
	
	local istaozhuang = 1		  
	 
	for i, Data in x311200_Stiletto_four_ID do
		if x311200_Stiletto_four_ID[i] == taozhuangid then
			istaozhuang = 1
		end
	end
	
	if (IsItemDark(sceneId, selfId, taozhuangid) == 1) then
		istaozhuang = 1
	end
	   
	 if istaozhuang == 0 then
	    x311200_NotifyTip( sceneId, selfId, "#{XQC_20080509_02}" )
			return
	 end
	 
	 if type ~= 1 and type ~= 2 then
	    x311200_NotifyTip( sceneId, selfId, "������������͡�" )
			return
	 end
	
	
	local	Bore_Count			= GetBagGemCount( sceneId, selfId, idBagPos )
	local nLevel					= GetBagItemLevel( sceneId, selfId, idBagPos )
	--�������
	ret	= LuaFnStilettoCostExe( sceneId, selfId, nLevel*100+1+Bore_Count, idBagPosStuff, type  )
	

	
	if ret == -1 then
		x311200_NotifyTip( sceneId, selfId, "���������ʲ߻���" )
		return
	elseif ret == -2 then
		if type == 1 then
			x311200_NotifyTip( sceneId, selfId, "#{XQC_20080509_07}" )
		else
			x311200_NotifyTip( sceneId, selfId, "#{JCDK_80905_07}" )
		end
		return
	elseif ret == -3 then
		if type == 1 then
			x311200_NotifyTip( sceneId, selfId, "#{XQC_20080509_08}" )
		else
			x311200_NotifyTip( sceneId, selfId, "#{JCDK_80905_08}" )
		end
		return
	elseif ret == -4 then
		if type == 1 then
			x311200_NotifyTip( sceneId, selfId, "#{XQC_20080509_07}" )
		else
			x311200_NotifyTip( sceneId, selfId, "#{JCDK_80905_07}" )
		end
		return
	elseif ret == 0 then --zchw
		x311200_NotifyTip( sceneId, selfId, "��Ǯʧ�ܣ�" );
		return
	end

	--���ִ��
	ret	= AddBagItemSlotFour( sceneId, selfId, idBagPos )
	if ret == -1 then
		x311200_NotifyTip( sceneId, selfId, "װ�����ʧ��" )
	elseif ret == -2 then
		x311200_NotifyTip( sceneId, selfId, "���ش���" )
	elseif ret == -3 then
		x311200_NotifyTip( sceneId, selfId, "#{XQC_20080509_06}" )
	elseif ret == -4 then
		x311200_NotifyTip( sceneId, selfId, "#{XQC_20080509_04}" ) 
	elseif ret == 1 then
	--д��Ϊ��־
	  local strLog =  format( "equip:%d level:%d material:%d", taozhuangid, nLevel, slotcailiao)
	  AuditSlotFour(sceneId, selfId, strLog)
	  
		x311200_NotifyTip( sceneId, selfId, "װ����׳ɹ�" )
		
		if isequipbind == 0 and isstuffbind == 1 and type == 2 then
			LuaFnItemBind( sceneId, selfId, idBagPos )
		end

	 	--�ɹ�����
	 	local transfer = GetBagItemTransfer(sceneId,selfId,idBagPos)
	 	local str = ""
	 	if type == 1 then
	 		str = format( "#{_INFOUSR%s}#{AQ_11}#{_INFOMSG%s}#{AQ_32}#{_INFOMSG%s}#{AQ_12}", GetName(sceneId,selfId),szCailiao,transfer )
	 	else
	 		str = format( "#{_INFOUSR%s}#{AQ_11}#{_INFOMSG%s}#{AQ_31}#{_INFOMSG%s}#{AQ_12}", GetName(sceneId,selfId),szCailiao,transfer )
	 	end
	 	BroadMsgByChatPipe( sceneId, selfId, str, 4 )

		--������Ч
	 	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end
end
