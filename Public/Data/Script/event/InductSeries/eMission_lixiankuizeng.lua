--modified by roadangel
--��������


--�ű���
x500619_g_ScriptId		= 500619

--Ŀ������NPC����
x500619_g_Position_X	= 160.2399
x500619_g_Position_Z 	= 134.1486
x500619_g_SceneID			= 0
x500619_g_AccomplishNPC_Name 	= "����ʦ"

x500619_g_givegift_diffday 		= 6         --�ĳɳ���6���������czf, 2009.07.31
x500619_g_givegift_levellimit = 30     		--30��������30�������ܽ�
x500619_g_exppool_max					= 80000000	--����������ֵ


--����ÿ��ʮ����ľ��飬������ľ���Ϊ��Сʱ���񴲾���*2*��N-10��,NΪ��������[10--366]
x500619_g_ExpTbl = {

	[30]=765,[31]=787,[32]=810,[33]=832,[34]=855,
	[35]=877,[36]=900,[37]=922,[38]=945,[39]=967,
	[40]=990,[41]=1012,[42]=1035,[43]=1057,[44]=1080,
	[45]=1102,[46]=1125,[47]=1147,[48]=1170,[49]=1192,
	[50]=1215,[51]=1237,[52]=1260,[53]=1282,[54]=1305,
	[55]=1327,[56]=1350,[57]=1372,[58]=1395,[59]=1417,
	[60]=1440,[61]=1462,[62]=1485,[63]=1507,[64]=1530,
	[65]=1552,[66]=1575,[67]=1597,[68]=1620,[69]=1642,
	[70]=1665,[71]=1687,[72]=1710,[73]=1732,[74]=1755,
	[75]=1777,[76]=1800,[77]=1822,[78]=1845,[79]=1867,
	[80]=1890,[81]=1912,[82]=1935,[83]=1957,[84]=1980,
	[85]=2002,[86]=2025,[87]=2047,[88]=2070,[89]=2092,
	[90]=3975,[91]=4346,[92]=4897,[93]=5516,[94]=6208,
	[95]=6976,[96]=7822,[97]=8751,[98]=9764,[99]=10866,
	[100]=10824,[101]=10789,[102]=10760,[103]=10736,[104]=10718,
	[105]=10705,[106]=10696,[107]=10693,[108]=10694,[109]=10699,
	[110]=10709,[111]=10722,[112]=10740,[113]=10761,[114]=10785,
	[115]=10813,[116]=10845,[117]=10880,[118]=10918,[119]=10959,
	[120]=11003,[121]=11050,[122]=11099,[123]=11152,[124]=11207,
	[125]=11265,[126]=11325,[127]=11388,[128]=11454,[129]=11521,
	[130]=11592,[131]=11664,[132]=11739,[133]=11816,[134]=11895,
	[135]=11976,[136]=12060,[137]=12145,[138]=12233,[139]=12323,
	[140]=12414,[141]=12508,[142]=12603,[143]=12701,[144]=12800,
	[145]=13260,[146]=13780,[147]=14363,[148]=15013,[149]=15732,
	[150]=0,

}

--���轱������Ʒid������
x500619_g_giftData = { nGiftId = 30505214, nGiftNum = 1 }

--**********************************
--������ں���
--**********************************
--����������ִ�д˽ű�
function x500619_OnDefaultEvent( sceneId, selfId, targetId )
	
	if x500619_CheckActiveDay() == 0 then
		return
	end
	
	if GetNumText() == 1 then
		local nCanGiftUnline = GetMissionData(sceneId, selfId, MD_GIFT_OUTLINE)
		if nCanGiftUnline == 1 then  --������ȡ���鵤
			
			BeginEvent( sceneId )
			AddText(sceneId, "��ս����\n")
			local szName = GetName(sceneId, selfId)	
			AddText(sceneId, "#{LXJY_80818_02}"..szName.."#{LXJY_80818_03}")
			AddItemBonus( sceneId, x500619_g_giftData.nGiftId, x500619_g_giftData.nGiftNum )
			EndEvent( sceneId )
			DispatchMissionContinueInfo(sceneId,selfId,targetId,x500619_g_ScriptId,-1)		
		
		else
			x500619_GiveExpNum( sceneId, selfId, targetId );
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x500619_OnEnumerate( sceneId, selfId, targetId )            --�����Ƿ���������ж��Ƿ���ʾ�öԻ�

	if x500619_CheckActiveDay() == 0 then
		return
	end

	local nCanGiftUnline = GetMissionData(sceneId, selfId, MD_GIFT_OUTLINE)
	local nPoolExp 	= GetMissionData(sceneId, selfId, MD_LIXIAN_POOLEXP);
	if (nPoolExp > 0 or nCanGiftUnline == 1) then
		AddNumText( sceneId, x500619_g_ScriptId, "#G��ս����", 6, 1 )
	end
	
end

--**********************************
--�ύ���������������
--**********************************
function x500619_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	local nCanGiftUnline = GetMissionData(sceneId, selfId, MD_GIFT_OUTLINE)
	if nCanGiftUnline == 1 then  --������ȡ���鵤
		BeginAddItem(sceneId)                --����Ʒ
			AddItem(sceneId, x500619_g_giftData.nGiftId, x500619_g_giftData.nGiftNum)
		local canAdd = EndAddItem(sceneId,selfId)	
		if canAdd > 0 then									--�����пռ�
			x500619_SetGiveFlag(sceneId, selfId, 0)   
			for count=1, x500619_g_giftData.nGiftNum do       --����Ʒ
				bagPos = TryRecieveItem( sceneId, selfId, x500619_g_giftData.nGiftId, QUALITY_MUST_BE_CHANGE )
				LuaFnItemBind( sceneId, selfId, bagPos )
			end
			--ͳ�Ƹ���Ʒ����
			AddOutlineGiftLog(sceneId, selfId, 2, x500619_g_giftData.nGiftId, x500619_g_giftData.nGiftNum )
	
			--������
			x500619_GiveExpNum( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
			AddText(sceneId, "#{ LXJY_80818_04}")
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
end


--**********************************
--����
--**********************************
function x500619_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--�����Ƿ��������������ı�־���ú���
--**********************************
function x500619_CheckUnlineGift( sceneId, selfId )

	if x500619_CheckActiveDay() == 0 then
		x500619_SetGiveFlag(sceneId, selfId, 0)
		return
	end

	local nDiffDay= GetLoginDiffTime( sceneId, selfId)
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	
	--���ÿ�ε�½�������������ܹؼ�����Ϊ�������Ƿ���������
	if (nDiffDay > x500619_g_givegift_diffday and CurLevel >= x500619_g_givegift_levellimit) then
		x500619_CalcGiveExpNum( sceneId, selfId );
		x500619_SetGiveFlag(sceneId, selfId, 1);
		LuaFnSendSystemMail( sceneId, GetName(sceneId, selfId), "#{LXJY_80818_01}" )   -- ���ʼ�
	else
		local nCurPoolExp = GetMissionData( sceneId, selfId, MD_LIXIAN_POOLEXP );
		if( nCurPoolExp > 0 ) then
			LuaFnSendSystemMail( sceneId, GetName(sceneId, selfId), "#{LXJY_90226_04}" )	-- ���ʼ�
		end
		x500619_SetGiveFlag(sceneId, selfId, 0)
	end
	
end

--������辭��صľ���ֵ
function x500619_CalcGiveExpNum( sceneId, selfId )
	
	--�ȼ�
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	if (CurLevel < 30 or CurLevel > 150) then
		return 
	end

	--����
	local nDiffDay = GetLoginDiffTime( sceneId, selfId)
	if nDiffDay <= x500619_g_givegift_diffday then    --����10�죬��������
		return 
	elseif nDiffDay > 366 then
		nDiffDay = 366                                --����366�죬��366����
	end

	--������㹫ʽ��C*2*(N-1) CΪ��Сʱ���񴲾��飬NΪ��������
	local ExpInHan = x500619_g_ExpTbl[CurLevel] * 60   --30�뺮�񴲾���*60 = 30���Ӻ��񴲾���
	
	local nGiveReady = 0
	if CurLevel >= 90 then
		nGiveReady = ExpInHan * 2 * ( nDiffDay - x500619_g_givegift_diffday )
	elseif CurLevel >= 30 then
		nGiveReady = ExpInHan * 2 * 1.5 * ( nDiffDay - x500619_g_givegift_diffday )
	end
	
	local CurExp = GetExp( sceneId, selfId )
	--���ܳ������޾���
	local nFullExp = GetFullExp( sceneId, selfId )
	if nGiveReady > nFullExp then
		nGiveReady = nFullExp 
	end
	
	local nCurPoolExp = GetMissionData(sceneId, selfId, MD_LIXIAN_POOLEXP)
	if(nGiveReady + nCurPoolExp > x500619_g_exppool_max) then
		SetMissionData( sceneId, selfId, MD_LIXIAN_POOLEXP, x500619_g_exppool_max )
		AddOutlineGiftLog( sceneId, selfId, 3, x500619_g_exppool_max, nDiffDay )
	else
		SetMissionData( sceneId, selfId, MD_LIXIAN_POOLEXP, nCurPoolExp + nGiveReady )
		AddOutlineGiftLog( sceneId, selfId, 3, nCurPoolExp + nGiveReady, nDiffDay )
	end 

end

--���ݾ���������ݸ���Ҿ���
function x500619_GiveExpNum( sceneId, selfId, targetId )

	local nPoolExp 	= GetMissionData( sceneId, selfId, MD_LIXIAN_POOLEXP )
	if( nPoolExp ) <= 0 then
		return 
	end
	
	local nFullExp 	= GetFullExp( sceneId, selfId )
	local nCurExp 	= GetExp( sceneId, selfId )
	local nGiveExp 	= 0;
	local nDiffDay 	= GetLoginDiffTime( sceneId, selfId)
	if( nPoolExp + nCurExp > nFullExp ) then
		nGiveExp = nFullExp - nCurExp;
		--PrintStr(nGiveExp)	
		if( nGiveExp > 0 ) then
			nPoolExp = nPoolExp - nGiveExp 
			if( nPoolExp < 0 ) then
				nPoolExp = 0 
			end	
		
			SetMissionData(sceneId, selfId, MD_LIXIAN_POOLEXP, nPoolExp)
			AddExpMore(sceneId, selfId, nGiveExp);    --������ 
			AddOutlineGiftLog(sceneId, selfId, 1, 0, nGiveExp)
		end
					
		BeginEvent( sceneId )
		AddText(sceneId, "��ս����\n")
		local szName = GetName(sceneId, selfId)	
		AddText(sceneId, "#{LXJY_80818_02}"..szName.."#{LXJY_80818_03}")
		AddText(sceneId, "#{LXJY_90226_01}")	
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else
		nGiveExp = nPoolExp
		--PrintStr(nGiveExp);	
		SetMissionData(sceneId, selfId, MD_LIXIAN_POOLEXP, 0)
		AddExpMore(sceneId, selfId, nGiveExp)    --������ 
		AddOutlineGiftLog(sceneId, selfId, 1, 1, nGiveExp)
				
		BeginEvent( sceneId )
		AddText(sceneId, "��ս����\n")
		local szName = GetName(sceneId, selfId)	
		AddText(sceneId, "#{LXJY_80818_02}"..szName.."#{LXJY_80818_03}")
		AddText(sceneId, "#{LXJY_90226_03}")	
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end
--MD_GIFT_OUTLINE����:
--0:��������������
--1�������������������Ʒ
--2��������������������飬û�����Ʒ
function x500619_SetGiveFlag(sceneId, selfId, nFlag)

	if (nFlag == 1 or nFlag == 2) then
		SetMissionData(sceneId, selfId, MD_GIFT_OUTLINE, nFlag)
	else
		SetMissionData(sceneId, selfId, MD_GIFT_OUTLINE, 0)
	end
end

function x500619_CheckActiveDay(sceneId, selfId, nFlag)

	return 1;
	
	--local nDay = GetTime2Day(sceneId)
	--local bRet = 0
	
	--if nDay >= x500619_g_starttime and nDay <= x500619_g_endtime then
	--	bRet = 1
	--else 
	--	bRet = 0
	--end
	
	--return bRet		
end
