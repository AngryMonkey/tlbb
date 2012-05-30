--�
--�齱
--LuaFnGetAvailableItemCount(sceneId, selfId, itemId)


x808065_g_ScriptId = 808065;

--x808065_g_StartDayTime = 7285; --10.12
x808065_g_StartDayTime = 7304; --11.01
x808065_g_EndDayTime = 7325;   --11.22

x808065_g_ItemId   =
{
	["choujiang1"] = 40004431,
	["choujiang2"] = 30900006,
	["choujiangtudi"] = 40004433,
	["choujiangshifu"] = 40004432,
}

x808065_g_Key				=
{
	["choujiang1"]	=	101,			--�齱�1
	["choujiang2"]	= 102,			--�齱�2
	["choujiang3"]	= 103,			--�齱�3
	["choujianghuodong"]	= 104,			--�齱˵��
	["choujiangshuoming1"] = 105,
	["choujiangshuoming2"] = 106,
	["choujiangshuoming3"] = 107,
}

function x808065_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x808065_CheckRightTime();
	if 1 ~= isTime then
	
		return
		
	end
	
	local NumText = GetNumText();	
	local MyLevel = GetLevel( sceneId, selfId );
	if(NumText == x808065_g_Key["choujiang1"]) then
	
		if(MyLevel < 20) then
		
			x808065_Printf( sceneId,  selfId, targetId , ""..GetName( sceneId, selfId ).."��������ڽ�������ͷ��Ϊ�����������±��ᱦ�ı�׼����һ�����롣�㻹�ǵȵ�#G20��#W�����齱�ɣ�");
			
		elseif(MyLevel >=20 and MyLevel < 40) then
		
			local Num = LuaFnGetAvailableItemCount(sceneId, selfId, x808065_g_ItemId["choujiang1"]);
			if(Num > 0) then
			
				x808065_Printf( sceneId, selfId, targetId,  ""..GetName( sceneId, selfId ).."����ĵ�ȷȷ�ǽ����ϲ��ɺ��ӵ�һ���������������㲻��֮ǰ���Ѿ��������������������㿴�������ϻ����Ž�ȯ�أ�");
				
			else
				
				if( x808065_AddJiangjuan( sceneId, selfId, x808065_g_ItemId["choujiang1"]) == 1) then
				
					x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."�����Ѿ��ɹ��ؽ����˳齱����������Ѿ�������齱�����������ĵȴ�֪ͨ��������������������˲��ٷ���վ");
					
				end
			
			end
			
		end
	
	elseif(NumText == x808065_g_Key["choujiang2"] ) then
		
		if(MyLevel < 40) then
		
			x808065_Printf(sceneId, selfId, targetId, ""..GetName( sceneId, selfId ).."��������ڽ�������ͷ��Ϊ��������ֻ�н���������������������ȡ��ˬ������أ��㻹�Ǵﵽ#G40��#W������ȡ��ˬ������ɣ�");
			
		elseif(MyLevel >=40 and MyLevel <=45) then
			
			if( GetMissionFlag( sceneId, selfId, MF_CHOUJIANGDALIBAO01 ) == 1) then
			--�Ѿ����
				x808065_Printf(sceneId, selfId, targetId, ""..GetName( sceneId, selfId ).."����ĵ�ȷȷ�ǽ���������һ���������������㲻��֮ǰ���Ѿ�����������ȡ����ˬ�����������");
			
			elseif( GetMissionFlag( sceneId, selfId, MF_CHOUJIANGDALIBAO01 ) == 0) then
			
				if( x808065_PutIntoPack( sceneId, selfId, targetId, x808065_g_ItemId["choujiang2"], QUALITY_MUST_BE_CHANGE, 1 , 1) == 1) then
				
					SetMissionFlag(sceneId, selfId, MF_CHOUJIANGDALIBAO01, 1);
					x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."�����Ѿ��ɹ��ػ���˳�ˬ�����������������Ұɣ����Ӧ�ö���һ������ϲ���ĺö����أ�");
					
				end
			
			end
		
		elseif(MyLevel > 45 and MyLevel < 50) then
		
			x808065_Printf(sceneId, selfId, targetId, ""..GetName( sceneId, selfId ).."��������ڽ�������ͷ��Ϊ��������ֻ�н���������������������ȡ��ˬ������أ��㻹�Ǵﵽ#G50��#W������ȡ��ˬ������ɣ�");
			
		elseif(MyLevel >= 50 and MyLevel <= 55) then
		
			if( GetMissionFlag( sceneId, selfId, MF_CHOUJIANGDALIBAO02 ) == 1) then
			--�Ѿ����
				x808065_Printf(sceneId, selfId, targetId, ""..GetName( sceneId, selfId ).."����ĵ�ȷȷ�ǽ���������һ���������������㲻��֮ǰ���Ѿ�����������ȡ����ˬ�����������");
			
			elseif( GetMissionFlag( sceneId, selfId, MF_CHOUJIANGDALIBAO02 ) == 0) then
			
				if( x808065_PutIntoPack( sceneId, selfId, targetId, x808065_g_ItemId["choujiang2"], QUALITY_MUST_BE_CHANGE, 2 , 1) == 1) then
				
					SetMissionFlag(sceneId, selfId, MF_CHOUJIANGDALIBAO02, 1);
					x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."�����Ѿ��ɹ��ػ���˳�ˬ�����������������Ұɣ����Ӧ�ö���һ������ϲ���ĺö����أ�");
					
				end
			
			end
				
		end
		
	elseif(NumText == x808065_g_Key["choujiang3"]) then
		x808065_ShiTuPrizeOption3(sceneId,selfId,targetId)
		return
		--local TeamFlag = LuaFnHasTeam( sceneId, selfId )
		--if( TeamFlag ~=1 ) then
		----û�����
		--	x808065_Printf(sceneId , selfId, targetId ,"����Ҫ�����ʦ������ͽ����Ӳ������μ�ʦͽ�齱Ŷ�� ��ס��һ����ʦ�����ӳ���ͽ������Ա���С����Ҷ����ﲻ����������Ŷ��");
		--	return
		--
		--end
		--
		--local TeamSize = LuaFnGetTeamSize( sceneId, selfId );
		--local NearTeamSize = GetNearTeamCount( sceneId, selfId )
		--if( TeamSize ~= NearTeamSize) then
		----����Ա�ڲ��ڸ���
		--	x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."�����ж��Ѳ��ڸ����أ�");
		--	return
		--	
		--end
		--
		--if( TeamSize < 2 ) then
		--
		--	x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."��Ϊ�ӳ���Ҫ���Լ���ͽ����Ӳ���һ�����μ�ʦͽ�齱�أ�");
		--	return		
		--
		--end
    --
		----�����ӵ�ʦ����ϵ
		--local OkTeam = 1
		--local leaderID = GetTeamLeader( sceneId, selfId )
		--local otherPlayer
		--for i=0, NearTeamSize-1 do
		--	otherPlayer = GetNearTeamMember( sceneId, selfId, i )
		--	if leaderID ~= otherPlayer and LuaFnIsMaster(sceneId, otherPlayer, leaderID) ~= 1 then
		--		OkTeam = 0;
		--		break;
		--	end
		--end
		--if OkTeam == 0 then
		----��ӹ�ϵ����ȷ
		--	if(leaderID == selfId) then
		--	--���Ƕӳ�
		--		
		--		local PrenticeNum = LuaFnGetmasterLevel( sceneId, selfId );
		--		if( PrenticeNum == 0) then
		--			--ʦ�µ�
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."����Ϊ�ӳ������ȵ��Լ���ʦ������һ�����μ�ʦͽ�齱�أ�");
		--			return
		--		
		--		end
		--		x808065_Printf(sceneId , selfId, targetId , ""..GetName( sceneId, selfId ).."����Ϊ�ӳ������������˲������ͽ���أ��㻹�Ǻ����ͽ��һ������ȡ�ɣ�");
		--		return
		--		
		--	else
		--	--�Ҳ��Ƕӳ�
		--		if(LuaFnHaveMaster( sceneId, selfId ) == 0) then
		--		
		--			x808065_Printf(sceneId , selfId, targetId , ""..GetName( sceneId, selfId ).."����Ϊ��Ա�����ȵ��Լ���ʦ������һ�����μ�ʦͽ�齱�أ�");
		--			return
		--		
		--		end
		--		x808065_Printf(sceneId , selfId, targetId , ""..GetName( sceneId, selfId ).."����Ϊ��Ա�������ڶ���Ķӳ��������ж�Ա��ʦ���أ�Ҫȷ���ӳ������ж�Ա��ʦ�����а���");
		--		return
		--		
		--	end
		--end
		--
		----���ȼ�
		--OkTeam = 1;
		--leaderID = GetTeamLeader( sceneId, selfId );
		--otherPlayer = 0;
		--for i=0, NearTeamSize-1 do
		--	otherPlayer = GetNearTeamMember( sceneId, selfId, i );
		--	if( leaderID == otherPlayer ) then
		--	else
		--		if(GetLevel(sceneId, otherPlayer) < 30 or GetLevel(sceneId, otherPlayer) > 49 ) then
		--			OkTeam = 0;
		--			break;
		--		end
		--	end
		--end
		--if OkTeam == 0 then
		----���˵ȼ�������Ҫ��
		--	if(leaderID == selfId) then
		--	--�ӳ�
		--		x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."����Ϊ�ӳ����μ�ʦͽ�齱�������ǣ�����ӵ�ͽ�ܵĵȼ���#G30����49��#W֮��Ŷ������һλͽ���Ѿ���������ȼ���Χ�����أ�");
		--		return
		--		
		--	else
		--	
		--		if(GetLevel(sceneId, selfId) < 30 or GetLevel(sceneId, selfId) > 49) then
		--		
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."����Ϊ��Ա���μ�ʦͽ�齱�������ǣ���ĵȼ���#G30����49��#W֮��Ŷ�����Ѿ���������ȼ���Χ�����أ�");
		--			return 
		--			
		--		else
		--	
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."����Ϊ��Ա���μ�ʦͽ�齱�������ǣ���ʦ����ӵ�ͽ�ܵĵȼ�����#G30����49��#W֮��Ŷ�����һ�������Ѿ���������ȼ���Χ�����أ�");
		--			return
		--			
		--		end
		--		
		--	end
		--end
		--
		----ok ��������
		--if(leaderID == selfId) then
		----�ӳ�
		--	
		--	local Num = LuaFnGetAvailableItemCount(sceneId, selfId, x808065_g_ItemId["choujiangshifu"]);
		--	if(Num > 0) then
		--	
		--		x808065_Printf( sceneId, selfId, targetId,  ""..GetName( sceneId, selfId ).."����Ϊ�ӳ������ǵĵ�ȷȷ�ǽ���������һ��ʦͽ�������������㲻��֮ǰ���Ѿ���������μӹ�ʦͽ�齱�������㿴�������ϻ����Ž�ȯ�أ�");
		--		
		--	else
		--		
		--		if( x808065_AddJiangjuan( sceneId, selfId, x808065_g_ItemId["choujiangshifu"]) == 1) then
		--		
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."����Ϊ�ӳ������Ѿ��ɹ��ؽ����˳齱����������Ѿ�������齱�����������ĵȴ�֪ͨ��������������������˲��ٷ���վ��");
		--			
		--		end
		--	
		--	end
		--	
		--else
		--
		--	local Num = LuaFnGetAvailableItemCount(sceneId, selfId, x808065_g_ItemId["choujiangtudi"]);
		--	if(Num > 0) then
		--	
		--		x808065_Printf( sceneId, selfId, targetId,  ""..GetName( sceneId, selfId ).."����Ϊ��Ա�����ǵĵ�ȷȷ�ǽ���������һ��ʦͽ�������������㲻��֮ǰ���Ѿ���������μӹ�ʦͽ�齱������");
		--		
		--	else
		--		
		--		if( x808065_AddJiangjuan( sceneId, selfId, x808065_g_ItemId["choujiangtudi"]) == 1) then
		--		
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."����Ϊ��Ա�����Ѿ��ɹ��ؽ����˳齱����������Ѿ�������齱�����������ĵȴ�֪ͨ��������������������˲��ٷ���վ��");
		--			
		--		end
		--	
		--	end
		--
		--end
	
	elseif(NumText == x808065_g_Key["choujianghuodong"]) then
		
		BeginEvent( sceneId )
			AddText( sceneId, "#{XSCJ_20070919_001}");
			AddNumText( sceneId, x808065_g_ScriptId, "#{XSCJ_20070919_002}", 11, x808065_g_Key["choujiangshuoming1"] )
			AddNumText( sceneId, x808065_g_ScriptId, "#{XSCJ_20070919_004}", 11, x808065_g_Key["choujiangshuoming2"] )
			AddNumText( sceneId, x808065_g_ScriptId, "#{XSCJ_20070919_006}", 11, x808065_g_Key["choujiangshuoming3"] )	
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif(NumText == 333) then
		SetMissionData( sceneId, selfId, MD_SHITU_PRIZE_COUNT, 0)
		for i = 60,80 do
			EraseItem(sceneId, selfId,i)
		end
		x808065_MessageBox( sceneId, selfId, "���¿�ʼ��ȡ��ʦ�����ɹ�" )
	end
	
	x808065_OnEventRequest( sceneId, selfId, targetId )
	
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x808065_OnEventRequest( sceneId, selfId, targetId )

		local	key	= GetNumText()
		if(key == x808065_g_Key["choujiangshuoming1"]) then
		
			x808065_Printf(  sceneId, selfId, targetId, "#{XSCJ_20070919_003}" )
			
		elseif(key == x808065_g_Key["choujiangshuoming2"]) then
		
			x808065_Printf(  sceneId, selfId, targetId, "#{XSCJ_20070919_005}" )
			
		elseif(key == x808065_g_Key["choujiangshuoming3"]) then
		
			x808065_Printf(  sceneId, selfId, targetId, "#{XSCJ_20070919_007}" )
			
		end
end

function x808065_OnEnumerate( sceneId, selfId, targetId )

		--x808065_Printf(sceneId, selfId, targetId, GetDayTime());

    local isTime = x808065_CheckRightTime();
    local MyLevel = GetLevel( sceneId, selfId );
    if 1 == isTime then    	
    	
    	if( MyLevel <= 39) then
				AddNumText( sceneId, x808065_g_ScriptId, "�±��ᱦ�����˳齱", 6, x808065_g_Key["choujiang1"] )
			end
			if ( MyLevel <= 55) then
				AddNumText( sceneId, x808065_g_ScriptId, "�±��ᱦ����ˬ�����", 6, x808065_g_Key["choujiang2"] )
			end
			AddNumText( sceneId, x808065_g_ScriptId, "�±��ᱦ����ʦ�齱", 6, x808065_g_Key["choujiang3"] )
			AddNumText( sceneId, x808065_g_ScriptId, "�齱˵��", 11, x808065_g_Key["choujianghuodong"] )												
			--AddNumText(sceneId,x808065_g_ScriptId, "��������ʦ�齱",9,333)
    end

end

function x808065_SendMail( sceneId, selfId )
	--�齱�
	if(x808065_CheckRightTime() == 1) then
		LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{XSCJ_20070919_008}" )
		LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{XSCJ_20070919_007}" )
	end
end

--**********************************
--����Ƿ��ѽ���
--**********************************
function x808065_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x808065_g_StartDayTime and curDayTime <= x808065_g_EndDayTime then
		return 1
	else
		return 0
	end

end

function x808065_CheckPacketSpace( sceneId, selfId, targetId, space )

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < space then
	
		x808065_Printf(sceneId,selfId, targetId, ""..GetName( sceneId, selfId ).."����������Ѿ������ء�ȥ����һ�����������ɣ��һ����������ģ�");
			
		return 0
		
	else
		return 1
	end

end

function x808065_PutIntoPack(sceneId, selfId, targetId, itemId, flag, num, isBind)
	
	if(x808065_CheckPacketSpace(sceneId, selfId, targetId, num) == 1) then
	--�Ͷ���
		for i=0,num-1 do
			local bagIndex = TryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE );
			if(isBind == 1) then
				LuaFnItemBind( sceneId, selfId, bagIndex);
			end
		end
		return 1;
	else
		return 0;
	end
	
end

--����
function x808065_MessageBox( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x808065_Printf(  sceneId, selfId, targetId, str )
		BeginEvent( sceneId );
			AddText(sceneId, str);
		EndEvent( sceneId );
		DispatchEventList( sceneId, selfId, targetId )		
end

function x808065_AddJiangjuan(sceneId, selfId, itemId)
		BeginAddItem( sceneId )
		AddItem( sceneId, itemId, 1 )
		ret = EndAddItem( sceneId, selfId )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId )
			--�ڳ齱��־�м�¼....
			--��־��ţ����GUID��������֣���ȯ��ƷID
			local logstr = format("PL:%d,0x%X,%s,%d",
									 				PRIZE_LOG_XINSHOUSHITU,
									 				LuaFnGetGUID(sceneId,selfId),
									 				GetName(sceneId,selfId),
									 				itemId)
			LuaFnLogPrize(logstr)
			return 1;
		else
			return 0;
		end
end

--��ʦͽ�齱ѡ��3
function x808065_ShiTuPrizeOption3(sceneId,selfId,targetId)
	--local sname = GetName( sceneId, selfId )
	--0.����Ƿ���ʦ�����
	--local	nMlevel	= LuaFnGetmasterLevel( sceneId, selfId )
	--if nMlevel < 1 or nMlevel > 4 then
	--	x808065_Printf( sceneId, selfId, targetId, sname.."����Ҫ�μ���ʦ�齱�������Ҫ��Ϊʦ�����а���")
	--	return
	--end
	--1.����Ƿ���ͽ��
	--if LuaFnGetPrenticeCount( sceneId, selfId ) == 0 then
	--	x808065_Printf( sceneId, selfId, targetId, sname.."����Ҫ�μ���ʦ�齱������ȵ�Ҫ����ͽ�ܲ��а�������ͽ��Ҫ����Ľ̵�������40����50��ʱ�����أ�")
	--	return 0
	--end
	--2.�Ƿ��콱�����Ѿ��ﵽʮ����
	--�����ڿ�ִ���ʼ���ȡ��ʱ���ж�
	--local ct = GetMissionData(sceneId, selfId, MD_SHITU_PRIZE_COUNT)
	--��ѯ���ʦ���ǲ����н����ʼ�
	LuaFnAskNpcScriptMail(sceneId, selfId, MAIL_SHITUPRIZE)
end
