--����NPC
--���

x805012_g_scriptId=805012
x805012_g_BuildingID6 = 3

--��Ʊ����ID
x805012_g_TicketItemIdx	=	40002000
x805012_g_OutDateTicketItemIdx	=	40000000
x805012_g_MerchandiseRate = 1.5
-- ����Ʊ�Ľ�������
x805012_g_GuildRate = 1.00		-- ���ɻ�õ��ʽ�ر�100%
x805012_g_PlayerRate = 0.20		-- ���˻�õ��ʽ�ر�20%

-- ÿ�����һ�������ȡ��Ʊ�Ĵ���
x805012_g_TicketTakeTimes = 8

-- ÿ������һ�������ȡ��Ʊ�Ĵ�������
x805012_g_BaseTotalTicketTakeTimes = 200

-- ����ÿ��һ���������ӵ���Ʊ��ȡ����
x805012_g_TicketTakeTimesBonusPerLvl = 25
x805012_g_TicketDecValue = 136
x805012_g_TicketIncValue = 680
x805012_g_TicketDecRate = 1.0
x805012_g_TicketIncRate = 1.0
x805012_g_GuildBoomIndex = 18
--��������С���
x805012_g_GuildMoneyLimit	=	10000

--**********************************
--�¼��������
--**********************************
function x805012_OnDefaultEvent( sceneId, selfId,targetId )

	--�Ƿ��Ǳ����Ա
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText

	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    ��������صأ�����������������ְ�����಻��Ӵ���"
			AddText(sceneId,strText)
			AddNumText( sceneId, x805012_g_scriptId, "���˵���",7,5)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	BeginEvent(sceneId)
		strText = "    ���¸��𱾰�Ǯ������Ǯ������֮������������������Щ�������ڰ�������кô���"
		AddText(sceneId,strText);
		AddNumText( sceneId, x805012_g_scriptId, "��ȡ��Ʊ", 6, 2 )
		AddNumText( sceneId, x805012_g_scriptId, "������Ʊ", 6, 3 )
		--AddNumText( sceneId, x805012_g_scriptId, "���˵���",7,1)
		AddNumText( sceneId, x805012_g_scriptId, "Ǯׯ����", 11, 4 )
		AddNumText( sceneId, x805012_g_scriptId, "���˵���",7,5)
		AddNumText( sceneId, x805012_g_scriptId, "��ҵ·��", 12, 6 )
		AddNumText( sceneId, x805012_g_scriptId, "�ݽ�������Ʊ", 6, 7 )
		AddNumText( sceneId, x805012_g_scriptId, "��ȡ����", 7, 8 )
		--life ���������������Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805012_g_scriptId,x805012_g_BuildingID6,888)
		AddNumText( sceneId, x805012_g_scriptId, "#{BPZJ_0801014_001}", 6, 11 )--����ʽ����
		AddNumText( sceneId, x805012_g_scriptId, "#{BPZJ_0801014_002}", 11, 12 )--���ڰ���ʽ����
		
		local Guildpos = GetGuildPos(sceneId, selfId)
		if x805012_IsManager(Guildpos)==1 then
			--�����߸���
			AddNumText( sceneId, x805012_g_scriptId, "��ȡ���ɹ����߸���", 7,  9)
			AddNumText( sceneId, x805012_g_scriptId, "���ڰ��ɹ����߸���", 11, 10 )
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x805012_DrawPay( sceneId, selfId  )

	--�ȼ�����40����
	local msg;
	if GetLevel( sceneId, selfId ) < 40 then
		msg = format("���ĵȼ�����40��������޷���ȡ���ʡ�");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	--�������ʱ����ڵ���1�ܡ�
	local nFactionJoinTime = GetFactionJoinTime( sceneId, selfId );
	
	local nTimeCur = LuaFnGetCurrentTime()
	local nTimeDelta = nTimeCur - nFactionJoinTime;
	if nTimeDelta < 7*24*60*60 then
		msg = format("������ʱ�䲻��1�ܣ��޷���ȡ���ʡ�");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	local nWeekCur = GetWeekTime();		--��ǰʱ��			

	--����ÿ����2�������ϡ�
	local nCaoYunTime = GetMissionData( sceneId, selfId, MD_CAOYUN_COMPLETE_TIME );
	local nCaoYunNum = mod(nCaoYunTime,1000);
	local nWeek = floor(nCaoYunTime/1000)
	local Guildpos = GetGuildPos(sceneId, selfId)

	if ((Guildpos ~= GUILD_POSITION_CHIEFTAIN) and (Guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN)) then
		if nCaoYunNum < 2 or nWeek~= nWeekCur then
			msg = format("�����ܵ����̴�������2�Ρ�");
			x805012_NotifyTips(sceneId, selfId, msg);
			return 0;
		end	
	end


	--������ȡ�����ﵽ����
	local nFactionAllTimeNum = CityGetAttr(sceneId, selfId, 14);
	
	local nFactionAllNum = mod(nFactionAllTimeNum,1000)
	local nFactionWeek = floor(nFactionAllTimeNum/1000)
	
	if nWeekCur ~= nFactionWeek then
		nFactionAllNum = 0;
		nFactionAllTimeNum = nWeekCur*1000 + nFactionAllNum;
		local canset = CanCitySetAttr(sceneId, selfId, 14)
	--	if canset >= 1 then
			CitySetAttr(sceneId, selfId, 14, nFactionAllTimeNum)			
	--	end
	end
	
	if nFactionAllNum >= 200 then
		msg = format("�Բ��𣬱��ܱ�����ȡ���ʴﵽ���ߡ�");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
		msg = format("��ǰ���ﴦ�ڵ�ά��״̬���޷���ȡ���ʣ�");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	
	--ÿ��ֻ����ȡ1�ι��ʡ�	
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_DRAWPAY_TIME );	
	
	local nNum = mod(nDrawPayTimeLast,1000)
	local nWeek = floor(nDrawPayTimeLast/1000)

	local isPosLongEnough = IsGuildPosLongEnough(sceneId, selfId);
	local minusContri = 30

	if (isPosLongEnough == 1) then
		if (Guildpos == GUILD_POSITION_ASS_CHIEFTAIN) then
			minusContri = 15
		elseif (Guildpos == GUILD_POSITION_CHIEFTAIN) then
			minusContri = 0
		end
	end
	
	if nWeekCur ~= nWeek then
	
		--ÿ����ȡ��Ҫ�ķ�30��ﹱ��
		local nContribPoint = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT);
		nContribPoint = nContribPoint - minusContri;		
		if nContribPoint < 0 then
			msg = format("���İﹱ���㣬����޷���ȡ���ʡ�");
			x805012_NotifyTips(sceneId, selfId, msg);
			nContribPoint = 0;
			return 0;
		end
		
		--��ȡ��Ǯ
		local guildLevel = GetGuildLevel( sceneId, selfId )
		local goldGet = 0;
		if guildLevel == 1 then
			goldGet = 5*10000;
		elseif guildLevel == 2 then
			goldGet = 6*10000;
		elseif guildLevel == 3 then
			goldGet = 7*10000;
		elseif guildLevel == 4 then
			goldGet = 8*10000;
		elseif guildLevel == 5 then
			goldGet = 9*10000;
		end		
		
		local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY);
		
		if GuildMoney < goldGet then
			x805012_NotifyTips(sceneId, selfId, "���ɵ��ʽ��㣬���������");
			return 0;
		end
		
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*goldGet)
		
		nFactionAllNum = nFactionAllNum + 1;
		nFactionAllTimeNum = nWeekCur*1000 + nFactionAllNum;
		local canset = CanCitySetAttr(sceneId, selfId, 14)
	--	if canset >= 1 then
			CitySetAttr(sceneId, selfId, 14, nFactionAllTimeNum)			
	--	end

		if (isPosLongEnough == 1) then
			if(Guildpos == GUILD_POSITION_CHIEFTAIN) then
				x805012_NotifyTips(sceneId, selfId, "�����ΰ���һְ����һ��ʱ�䣬������ȡ���ʲ����İﹱ��");
			elseif(Guildpos == GUILD_POSITION_ASS_CHIEFTAIN) then
				x805012_NotifyTips(sceneId, selfId, "�����θ�����һְ����һ��ʱ�䣬������ȡ�������ĵİﹱ���롣");
			end
		end

		CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, (-1)*minusContri)			
		
		local guildid = GetHumanGuildID(sceneId,selfId);
		LuaFnAuditPlayerGetGuildWage( sceneId, selfId, guildid, goldGet);

		nNum = 1;
		nDrawPayTimeLast = nWeekCur*1000 + nNum;
		SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, nDrawPayTimeLast );	
				
		
		AddMoney( sceneId, selfId, goldGet );
		local  PlayerName=GetName(sceneId,selfId);
		local sMessage = format("@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#cffff00�ڰ��ɵĽ���ܹ�ǮΪһ����ȡ�˱��ܵĹ��ʣ�����#{_MONEY%d}��", PlayerName, goldGet );	
	    BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
		
		
	else
		if nNum >= 1 then
			msg = format("�������Ѿ�������ʣ����������ɡ�");
			x805012_NotifyTips(sceneId, selfId, msg);
			return 0;
		end
		--ÿ����ȡ��Ҫ�ķ�30��ﹱ��
		local nContribPoint = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT);
		nContribPoint = nContribPoint - minusContri;		
		if nContribPoint < 0 then
			msg = format("���İﹱ���㣬����޷���ȡ���ʡ�");
			x805012_NotifyTips(sceneId, selfId, msg);
			nContribPoint = 0;
			return 0;
		end
		
		--��ȡ��Ǯ
		local guildLevel = GetGuildLevel( sceneId, selfId )
		local goldGet = 0;
		if guildLevel == 1 then
			goldGet = 5*10000;
		elseif guildLevel == 2 then
			goldGet = 6*10000;
		elseif guildLevel == 3 then
			goldGet = 7*10000;
		elseif guildLevel == 4 then
			goldGet = 8*10000;
		elseif guildLevel == 5 then
			goldGet = 9*10000;
		end		
		
		local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY);
		
		if GuildMoney < goldGet then
			x805012_NotifyTips(sceneId, selfId, "���ɵ��ʽ��㣬���������");
			return 0;
		end
		
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*goldGet)
		
		
		
		nFactionAllNum = nFactionAllNum + 1;
		nFactionAllTimeNum = nWeekCur*1000 + nFactionAllNum;
		local canset = CanCitySetAttr(sceneId, selfId, 14)
	--	if canset >= 1 then
			CitySetAttr(sceneId, selfId, 14, nFactionAllTimeNum)
	--	end
		
		if (isPosLongEnough == 1) then
			if(Guildpos == GUILD_POSITION_CHIEFTAIN) then
				x805012_NotifyTips(sceneId, selfId, "�����ΰ���һְ����һ��ʱ�䣬������ȡ���ʲ����İﹱ��");
			elseif(Guildpos == GUILD_POSITION_ASS_CHIEFTAIN) then
				x805012_NotifyTips(sceneId, selfId, "�����θ�����һְ����һ��ʱ�䣬������ȡ�������ĵİﹱ���롣");
			end
		end
		
		CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, (-1)*minusContri)	
		local guildid = GetHumanGuildID(sceneId,selfId);
		LuaFnAuditPlayerGetGuildWage( sceneId, selfId, guildid, goldGet);		

		nNum = nNum + 1;
		nDrawPayTimeLast = nWeekCur*1000 + nNum;
		SetMissionData(sceneId, selfId, MD_DRAWPAY_TIME, nDrawPayTimeLast );
		
		AddMoney( sceneId, selfId, goldGet );

		local  PlayerName=GetName(sceneId,selfId);
		local sMessage = format("@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#cffff00�ڰ��ɵĽ���ܹ�ǮΪһ����ȡ�˱��ܵĹ��ʣ�����#{_MONEY%d}��", PlayerName, goldGet );	
	    BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
	end
	

end


--�ж��Ƿ��ǹ����
function x805012_IsManager( Guildpos  )
    if (   (Guildpos == GUILD_POSITION_CHIEFTAIN) 
	    or (Guildpos == GUILD_POSITION_ASS_CHIEFTAIN)
	    or (Guildpos == GUILD_POSITION_HR)
	    or (Guildpos == GUILD_POSITION_INDUSTRY)
	    or (Guildpos == GUILD_POSITION_AGRI)
	    or (Guildpos == GUILD_POSITION_COM) 
	   )then
        return 1;
		end
		return 0;
end


--��ȡ���ɹ����߸���
function x805012_DrawManagerBonus( sceneId, selfId  )

	local msg;
	
	--���뵣�ι�ְ���ڵ���5�졣
	if( LuaFnGetGuildAppointTime( sceneId, selfId ) < MIN_APPOINT_TIME_FOR_BONUS ) then
	    msg = format("�㿴���㣬�¹����Σ�Ҫ��Ϊ�������������飬�����Ǽ��������츣���������������ɣ�");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end


	local Guildpos = GetGuildPos(sceneId, selfId)
	if ( x805012_IsManager(Guildpos)~=1 ) then
        msg = format("�㲻�ǹ���㣬������ȡ���ɹ�Ա������");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end


	if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
		msg = format("��������ʽ��ȱ��ÿһ��Ǯ��Ҫ���ڵ����ϡ������߸���ֻ����ͣ��������");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	if GetTodayWeek() ~= 0 then
	    msg = format("��û�����Ź����߸�����ʱ���أ���Ҫ̫�ż�����");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	
	if GetFullExp(sceneId, selfId) == GetExp(sceneId, selfId) then
	    msg = format("��ľ����Ѿ��ﵽ���ޣ�������ȡ����̫��ֵ�˰ɡ�ȥ�õ�һЩ�����ɣ�");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	
	--ÿ��ֻ����ȡ1�ΰ�ḣ����	
	local nWeekCur = GetWeekTime();		--��ǰʱ��		
	
	local nDrawPayTimeLast = GetMissionData( sceneId, selfId, MD_GUILD_MANAGER_DRAW_BONUS );	
		
	if nWeekCur ~= nDrawPayTimeLast then

		--��ȡ��Ǯ
		local guildLevel = GetGuildLevel( sceneId, selfId )
		local goldGet = 0;	
		
		local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY);
	
		local nCount1 = GuildMoney * GUILD_MANAGER_BONUS_MONEY_TABLE[Guildpos][1];
		local nCount2 = guildLevel * GUILD_MANAGER_BONUS_MONEY_TABLE[Guildpos][2];
	
		goldGet = (( nCount1 < nCount2 ) and nCount1) or nCount2
		
		if GuildMoney < goldGet then
			x805012_NotifyTips(sceneId, selfId, "���ɵ��ʽ��㣬���������");
			return 0;
		end
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*goldGet)
		AddMoney( sceneId, selfId, goldGet );
		
		--��þ���
		local level = GetLevel(sceneId, selfId)
		local expGet = guildLevel * level * GUILD_MANAGER_BONUS_EXP_TABLE[Guildpos];
		AddExp( sceneId, selfId, expGet );
		-- add by zchw for welfare
		AuditDrawGuildWelfare(sceneId, selfId, goldGet, expGet);
			
		SetMissionData(sceneId, selfId, MD_GUILD_MANAGER_DRAW_BONUS, nWeekCur );	
		
		local  PlayerName=GetName(sceneId,selfId);
		local sMessage = format("@*;SrvMsg;GLD:#Y����[%s][#{_INFOUSR%s}]#cffff00��ȡ���ɹ�Աٺ»#{_MONEY%d}��%d�㾭�顣", GUILD_POSITION_NAME_TABLE[Guildpos],PlayerName, goldGet, expGet );	
        BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
	  
        msg = format("���ְ���ǣ�%s",GUILD_POSITION_NAME_TABLE[Guildpos]);
        x805012_NotifyTips(sceneId, selfId, msg);
				
	else
		msg = format("��������ٵģ������Ѿ����һ�ι����߸����ˣ���Ҫ��һ�β��ɣ�");
		x805012_NotifyTips(sceneId, selfId, msg);
		return 0;
	end
	

end



--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x805012_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����������������Ӧ�����ѡ��
	if eventId ~= x805012_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805012_g_scriptId, x805012_g_BuildingID6 )
		return
	end

	--�ز��̵�
	if GetNumText() == 1 then
		if(sceneId == 205) then DispatchShopItem( sceneId, selfId,targetId, 120 )
			elseif(sceneId == 206) then DispatchShopItem( sceneId, selfId,targetId, 121 )
			elseif(sceneId == 207) then DispatchShopItem( sceneId, selfId,targetId, 122 )
			elseif(sceneId == 208) then DispatchShopItem( sceneId, selfId,targetId, 123 )
			elseif(sceneId == 209) then DispatchShopItem( sceneId, selfId,targetId, 124 )
			elseif(sceneId == 210) then DispatchShopItem( sceneId, selfId,targetId, 125 )
			elseif(sceneId == 211) then DispatchShopItem( sceneId, selfId,targetId, 126 )
			elseif(sceneId == 212) then DispatchShopItem( sceneId, selfId,targetId, 127 )
			elseif(sceneId == 213) then DispatchShopItem( sceneId, selfId,targetId, 128 )
			elseif(sceneId == 214) then DispatchShopItem( sceneId, selfId,targetId, 129 )
			elseif(sceneId == 215) then DispatchShopItem( sceneId, selfId,targetId, 130 )
			elseif(sceneId == 216) then DispatchShopItem( sceneId, selfId,targetId, 131 )
			elseif(sceneId == 217) then DispatchShopItem( sceneId, selfId,targetId, 132 )
			elseif(sceneId == 218) then DispatchShopItem( sceneId, selfId,targetId, 133 )
			elseif(sceneId == 219) then DispatchShopItem( sceneId, selfId,targetId, 134 )
			elseif(sceneId == 220) then DispatchShopItem( sceneId, selfId,targetId, 135 )
			elseif(sceneId == 221) then DispatchShopItem( sceneId, selfId,targetId, 136	)
			elseif(sceneId == 222) then DispatchShopItem( sceneId, selfId,targetId, 137	)
		end
	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life ���������������Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805012_g_BuildingID6 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	--���������Ʊ
	elseif GetNumText() == 2 then
		--�Ƿ��Ǳ����Ա
		local guildid 		= GetHumanGuildID(sceneId,selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "���²��Ǳ����Ա���������񲻱���档"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--�Ƿ������˻����
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ((guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN) and (guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN) and (guildpos ~= GUILD_POSITION_AGRI) and (guildpos ~= GUILD_POSITION_INDUSTRY) and (guildpos ~= GUILD_POSITION_HR)) then
				BeginEvent(sceneId)
					strText = "�Բ���,ֻ�а�����������������ʹ���뻯ʹ������ʹ�Լ����˲��ܹ������Ʊ."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--�����Ƿ�
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "��λС�ֵ����ھ������̣�δ������һЩ�����絽40���������ң����ǵ���"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--��ͬ�����Ӧ��ͬ�Ľ��
		local curMoney = 0
		local maxMoney = 0
		local maxmaxMoney = 0

		if level>=40 and level<55 then
			curMoney = 20000
			maxMoney = 100000
			maxmaxMoney = 250000
		elseif level>=55 and level<70 then
			curMoney = 30000
			maxMoney = 150000
			maxmaxMoney = 350000
		elseif level>=70 and level<85 then
			curMoney = 40000
			maxMoney = 250000
			maxmaxMoney = 450000
		elseif level>=85 and level<100 then
			curMoney = 50000
			maxMoney = 300000
			maxmaxMoney = 550000
		
		elseif level>=100 and level<115 then
			curMoney = 50000
			maxMoney = 310000
			maxmaxMoney = 600000
		elseif level>=115 and level<130 then
			curMoney = 60000
			maxMoney = 320000
			maxmaxMoney = 650000
		
		elseif level>=130 and level<145 then
			curMoney = 70000
			maxMoney = 330000
			maxmaxMoney = 700000
		else
			curMoney = 80000
			maxMoney = 340000
			maxmaxMoney = 750000
		end

		--�Ƿ�������
		local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113)
		if haveImpact == 1 then
				BeginEvent(sceneId)
					strText = "�Բ���,�����ڴ�������״̬���ɽ�Ʊ"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end
		--�Ƿ�����Ʊ
		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805012_g_TicketItemIdx)

		if bagpos ~= -1	then
				BeginEvent(sceneId)
					strText = "�Բ���,��ֻ����ȡһ����Ʊ"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return

		elseif bagpos == -1 then

				--�����ʽ��Ƿ񹻿���һ����Ʊ��
				local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
				if GuildMoney <= curMoney then
						BeginEvent(sceneId)
							strText = "�����ʽ𲻹�Ϊ�㿪����Ʊ"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
				end

				-- һ��ֻ���� 8 ��
				local DayTimes, oldDate, nowDate, takenTimes, totalTakenTimes

				DayTimes = GetMissionData( sceneId, selfId, MD_GUILDTICKET_TAKENTIMES )
				oldDate = mod( DayTimes, 100000 )
				takenTimes = floor( DayTimes/100000 )

				nowDate = GetDayTime()
				if nowDate == oldDate then
					takenTimes = takenTimes + 1
				else
					takenTimes = 1
				end

				if takenTimes > x805012_g_TicketTakeTimes then
					BeginEvent( sceneId )
						AddText( sceneId, "�Բ�����������ȡ���������Ѿ��ﵽ8�Σ�������������" )
					EndEvent( sceneId )
					DispatchMissionTips( sceneId, selfId )
					return
				end

				-- ����һ���ȡ����������
				DayTimes = GetTicketTakenTimes( sceneId, selfId )
				oldDate = mod( DayTimes, 100000 )
				totalTakenTimes = floor( DayTimes/100000 )

				if nowDate == oldDate then
					totalTakenTimes = totalTakenTimes + 1
				else
					totalTakenTimes = 1
				end

				local guildLevel = GetGuildLevel( sceneId, selfId )
				if not guildLevel or guildLevel < 1 or guildLevel > 5 then
					guildLevel = 1
				end

				local maxTimes = x805012_g_BaseTotalTicketTakeTimes +
					x805012_g_TicketTakeTimesBonusPerLvl * ( guildLevel - 1 );
					
				local curGuildBoom = CityGetAttr(sceneId, selfId,x805012_g_GuildBoomIndex);
				if(curGuildBoom < x805012_g_TicketDecValue) then
					maxTimes = floor(maxTimes * x805012_g_TicketDecRate);
				elseif(curGuildBoom >= x805012_g_TicketIncValue) then
					maxTimes = floor(maxTimes * x805012_g_TicketIncRate);
				end

				if totalTakenTimes > maxTimes then
					BeginEvent( sceneId )
						AddText( sceneId, "���������ֻ��" .. maxTimes .. "����Ʊ�����ǿ�ϧ�������Ѿ������ˣ�������������Ϊ�á�" )
					EndEvent( sceneId )
					DispatchMissionTips( sceneId, selfId )
					return
				end


				-- ɾ�����ϵ�������Ʒ
				local itemIdx = 0
				for i = 0, 99 do
					itemIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )
					if itemIdx >= 20400001 and itemIdx <= 20400200 then
						LuaFnEraseItem( sceneId, selfId, i )
					end
				end

				BeginAddItem( sceneId )
				AddItem( sceneId, x805012_g_TicketItemIdx, 1 )
				ret = EndAddItem( sceneId, selfId )
				if ret > 0 then
					AddItemListToHuman(sceneId,selfId )
					bagpos = GetBagPosByItemSn(sceneId, selfId, x805012_g_TicketItemIdx)
					--�������ڳ���,��Ʒ���ͻ��Ӧ�õ���Ʒ��ֵ
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE, curMoney)
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE, maxMoney)
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MAX_MONEY_TYPE, maxmaxMoney)
					CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*curMoney)
					
					DayTimes = nowDate + totalTakenTimes * 100000
					SetTicketTakenTimes( sceneId, selfId, DayTimes )
					
					DayTimes = nowDate + takenTimes * 100000
					SetMissionData( sceneId, selfId, MD_GUILDTICKET_TAKENTIMES, DayTimes )
					
					LuaFnRefreshItemInfo(sceneId, selfId, bagpos)
					--����buff
					LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,113,0)
					BeginEvent(sceneId)
						strText = "�����ﻹ��" .. ( maxTimes + 1 - totalTakenTimes ) .. "����Ʊ���������ã�������Ʊ������ȥ����Ϊ����׬��Щ�ʽ𣬹��Ͳ�С����"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				else
					BeginEvent(sceneId)
						strText = "��ȡ��Ʊʧ��"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				end
		end
	--������Ʊ
	elseif GetNumText() == 3 then
		--�Ƿ��Ǳ����Ա
		local guildid 		= GetHumanGuildID(sceneId, selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
		--�Ƿ���������
		local merchandiseDayRate	=	1.0;
		
		if (GetTodayWeek() == 6 )then
			merchandiseDayRate = x805012_g_MerchandiseRate;
		end
		
		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "���²��Ǳ����Ա..."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--�Ƿ������˻����
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ( (guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN) and (guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN) and (guildpos ~= GUILD_POSITION_AGRI) and (guildpos ~= GUILD_POSITION_INDUSTRY) and (guildpos ~= GUILD_POSITION_HR)) then
				BeginEvent(sceneId)
					strText = "�Բ���,ֻ�а�����������������ʹ���뻯ʹ������ʹ�Լ����˲��ܹ�������Ʊ."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--�����Ƿ�
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "��λС�ֵ����ھ������̣�δ������һЩ..."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805012_g_TicketItemIdx)
		if bagpos ~= -1	then
			local	TicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE)
			local	MaxTicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE)
			if TicketMoney ~= 0 then

				if TicketMoney < MaxTicketMoney	then
						BeginEvent(sceneId)
							strText = "�����Ʊû��׬��Ӧ׬�ļ�ֵ����ȥ׬׬�ɡ�"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
				end

				local ReturnType = DelItem(sceneId, selfId, x805012_g_TicketItemIdx, 1)
				LuaFnCancelSpecificImpact(sceneId,selfId,113)
				if ReturnType == 0 then
					BeginEvent(sceneId)
						strText = "�޷�ɾ����Ʊ"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				else
					BeginEvent(sceneId)
						strText = "�ɹ�ɾ����Ʊ"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				end

				LuaFnAuditPaoShang(sceneId, selfId, TicketMoney)

				local	FatigueRate = 1.0

				local isLittleFatigueState 		= LuaFnIsLittleFatigueState(sceneId, selfId)
				local isExceedingFatigueState = LuaFnIsExceedingFatigueState(sceneId, selfId)
				
				if(isExceedingFatigueState == 1) then
					FatigueRate = 0.0
				elseif(isLittleFatigueState == 1) then
					FatigueRate = 0.5
				end

				CityChangeAttr(sceneId, selfId, GUILD_MONEY, TicketMoney * x805012_g_GuildRate*merchandiseDayRate*FatigueRate)	-- ���ɻ�õ��ʽ�ر�
				AddMoney(sceneId, selfId, TicketMoney * x805012_g_PlayerRate*merchandiseDayRate)	-- ���˻�õ��ʽ�ر�

				local contripoint = 0
				local exppoint		= 0

				if level>=11 and level <40 then
					contripoint = 5
					exppoint = 30000
				elseif level>=40 and level<60 then
					contripoint = 5
					exppoint = 45000
				elseif level>=60 and level<80 then
					contripoint = 5
					exppoint = 50000
				elseif level>=80 and level<100 then
					contripoint = 5
					exppoint = 55000
				elseif level>=100 and level<120 then
					contripoint = 5
					exppoint = 60000
				elseif level>=120 then
					contripoint = 5
					exppoint = 65000
				--else
				--	contripoint = 5
				--	exppoint = 30000
				end

				CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, contripoint)
				AddExp(sceneId, selfId, exppoint*merchandiseDayRate)

				--��¼ ��� ��Ϣ
				local nCaoYunTime = GetMissionData( sceneId, selfId, MD_CAOYUN_COMPLETE_TIME );
				
				local nCaoYunNum = mod(nCaoYunTime,1000)
				
				
				local nWeek = floor(nCaoYunTime/1000)
				

				local nWeekCur = GetWeekTime()		--��ǰʱ��
				--����һ�ܣ� �������� ��ɴ���
				if nWeekCur ~= nWeek then
					nCaoYunNum = 1;
					nCaoYunTime = nWeekCur*1000 + nCaoYunNum;
					SetMissionData(sceneId, selfId, MD_CAOYUN_COMPLETE_TIME, nCaoYunTime );				
				else
					nCaoYunNum = nCaoYunNum + 1;
					nCaoYunTime = nWeekCur*1000 + nCaoYunNum;
					SetMissionData(sceneId, selfId, MD_CAOYUN_COMPLETE_TIME, nCaoYunTime );
				end
			
			
				--����Ƶ��֪ͨ
				local name = GetName( sceneId, selfId )
				BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#Y#{_INFOUSR" .. name .. "}#R������������񣬳ɹ���Ϊ���������˰���ʽ�#{_MONEY"..TicketMoney*x805012_g_GuildRate*merchandiseDayRate*FatigueRate .. "}", 6 )
				--BroadMsgByChatPipe( sceneId, selfId, "22", 6 )
				
				if (merchandiseDayRate ~= 1.0  )then
					Msg2Player(sceneId, selfId, "#R���ڽ����������գ����������˱�ƽʱ��������档",MSG2PLAYER_PARA);
				end
				
				LuaFnComMissComplete( sceneId, selfId )
	
			else
				BeginEvent(sceneId)
					strText = "�Բ���,������Ʊ��ûǮ"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
		else
			BeginEvent(sceneId)
				strText = "�Բ���,��û����Ʊ"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_QianZhuang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 5 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ó����̵����
			UICommand_AddInt(sceneId,x805012_g_BuildingID6)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 104)
	elseif GetNumText() == 6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ó�����ҵ·�߽���
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 105)
	elseif GetNumText() == 7 then
			BeginEvent( sceneId )
				AddText( sceneId, "��ѹ�����Ʊ���뵽��һ����Ʒ���У�" )
			EndEvent( sceneId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x805012_g_scriptId, -1, 2 )
	elseif GetNumText() == 8 then
		--x805012_DrawPay( sceneId, selfId );
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x805012_g_scriptId)
			UICommand_AddInt(sceneId, targetId)
			UICommand_AddString(sceneId, "DrawPay");
			UICommand_AddString(sceneId, "��ȷ��Ҫ����һ�������İﹱ����ȡ���ܵİ��ɹ�����");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
	elseif GetNumText() == 9 then
		x805012_DrawManagerBonus( sceneId, selfId );
	elseif GetNumText() == 10 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BPFL_20080318_01}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 11 then
		local guildmoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
		local guildmaxmoney = CityGetAttr(sceneId, selfId, 16)
		
		if guildmoney < guildmaxmoney then
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId) --���ð����ʽ��������
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 19822)
		else  --����ʽ��Ѿ��������ޣ�����Ҫ�پ����ˡ�
			BeginEvent(sceneId)
				AddText(sceneId,"#{BPZJ_0801014_003}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif GetNumText() == 12 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BPZJ_0801014_019}")--����ʽ��������
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end

end

--**********************************
--����ύ���޺�Ļص�����
--**********************************
function x805012_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	if index1 < 0 or index1 >= 255 then
		x805012_MyNotifyTip( sceneId, selfId, "����û�з�����Ҫ�Ͻ��Ĺ�����Ʊ��" )
		return
	else
		if LuaFnIsItemAvailable( sceneId, selfId, index1) == 1 then
			local	itm_id		= LuaFnGetItemTableIndexByIndex( sceneId, selfId, index1 )
			if(itm_id == x805012_g_OutDateTicketItemIdx) then
				local	TicketMoney = GetBagItemParam(sceneId, selfId, index1, 0, 2)
				EraseItem( sceneId, selfId, index1) 
				CityChangeAttr(sceneId, selfId, GUILD_MONEY, TicketMoney)	-- ���ɻ�õ��ʽ�ر�
				AddMoney(sceneId, selfId, TicketMoney * 0.2)	-- ���˻�õ��ʽ�ر�
				local name = GetName( sceneId, selfId )
				BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}��֪���������һ�Ź�����Ʊ��#{_MONEY"..TicketMoney.."}�ѳ���Ϊ����İ���ʽ�", 6 )
				x805012_MyNotifyTip( sceneId, selfId, "������Ʊ�������ʽ�ɹ���" )
				return
			else
				x805012_MyNotifyTip( sceneId, selfId, "��Ҫ�Ͻ�����Ʒ�ƺ����ǹ�����Ʊ����" )
				return
			end
		end
	end
	x805012_MyNotifyTip( sceneId, selfId, "�ύʧ��" )
end

--**********************************
--����ύ����ʽ������Ļص�����
--**********************************
function x805012_PutGuildMoney( sceneId, selfId, money )
	--�Ƿ��Ǳ����Ա���������ǲ�����������Ǳ���ĳ�Ա�����ܴ򿪾������棬��Ϊ�˱��ջ��Ǽ���
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

	if guildid ~= cityguildid then
		x805012_NotifyTips(sceneId, selfId, "���²��Ǳ����Ա��")
		return
	end
	
	if money < x805012_g_GuildMoneyLimit then --��Ӧ���ߵ�������ǿͻ��˷Ƿ�����
		x805012_NotifyTips(sceneId, selfId, "����Ľ��С��#{_EXCHG"..x805012_g_GuildMoneyLimit.."}")
		return
	end
	
	--�Բ���������Ľ���������Я���Ľ�
	local nMoneyJZ = GetMoneyJZ(sceneId,selfId)
	local nMoneyJB = GetMoney(sceneId,selfId)
	local nMoneySelf = nMoneyJZ + nMoneyJB
	if nMoneySelf < money then
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_007}")
		return
	end
	
	--�Ƿ�ȫʱ�䣬����жϺ��������Լ�����ʾ��Ϣ������Ҫ����д��ʾ��Ϣ
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return
	end
	
	local addmoney = floor(money*0.9)
	--hzp 2008-12-15
	local guildmoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
	local guildmaxmoney = CityGetAttr(sceneId, selfId, 16)
	
	--PrintStr(" addmoney "..addmoney.." guildmoney "..guildmoney.." guildmaxmoney "..guildmaxmoney)
	
	if addmoney + guildmoney > guildmaxmoney then
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_021}#{_MONEY"..guildmaxmoney.."}#{BPZJ_0801014_014}")
		return
	end
	
	--local ret = CostMoney(sceneId, selfId, money)
	local jzCost, jbCost = LuaFnCostMoneyWithPriority( sceneId, selfId, money );	
	if jzCost == -1 then
		x805012_NotifyTips(sceneId, selfId, "�۳���Ǯʧ�ܣ�")
		return
	end
	--���ֻ�۳����
	if jzCost == 0 then
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, addmoney)
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_015}#{_MONEY"..jbCost.."}��")
		x805012_NotifyTips(sceneId, selfId, "��˰֮�󣬰���ʽ�ʵ��������#{_MONEY"..addmoney.."}��")
		local name = GetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}#{BPZJ_0801014_017}#{_MONEY"..jbCost.."}#{BPZJ_0801014_018}", 6 )
	end
	--���ֻ�۳�����
	if jbCost == 0 then
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, addmoney)
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_015}#{_EXCHG"..jzCost.."}��")
		x805012_NotifyTips(sceneId, selfId, "��˰֮�󣬰���ʽ�ʵ��������#{_MONEY"..addmoney.."}��")
		local name = GetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}#{BPZJ_0801014_017}#{_EXCHG"..jzCost.."}#{BPZJ_0801014_018}", 6 )
	end
	--������н������н��
	if jzCost ~= 0 and jbCost ~= 0 then
		CityChangeAttr(sceneId, selfId, GUILD_MONEY, addmoney)
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_015}#{_EXCHG"..jzCost.."}��")
		x805012_NotifyTips(sceneId, selfId, "#{BPZJ_0801014_015}#{_MONEY"..jbCost.."}��")
		x805012_NotifyTips(sceneId, selfId, "��˰֮�󣬰���ʽ�ʵ��������#{_MONEY"..addmoney.."}��")
		local name = GetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}#{BPZJ_0801014_017}#{_EXCHG"..jzCost.."}��#{_MONEY"..jbCost.."}#{BPZJ_0801014_018}", 6 )
		--BroadMsgByChatPipe( sceneId, selfId, "@*;SrvMsg;GLD:#{_INFOUSR"..name.."}#{BPZJ_0801014_017}#{_MONEY"..jbCost.."}#{BPZJ_0801014_018}", 6 )

	end
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x805012_NotifyTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
--**********************************
--��Ŀ��ʾ
--**********************************
function x805012_MyNotifyTip( sceneId, selfId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
