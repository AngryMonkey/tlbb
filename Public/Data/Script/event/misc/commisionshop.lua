-- �����̵�
-- �ű���

x800116_g_ScriptId = 800116  -- ������Ҳʹ���������ˡ��Ͻ��޸�

-- �����̵�UI 19850424

-- �����̵���Ϣ
x800116_g_CShopInfo = {
	-- 0 ���̵꣬�����Ļ���ò�Ҫ�������� Server һ�� ShopID �����󣬷���Ҫ��������ݽṹ
	[0] = {
		name = "#G������160��181��#R͡͡",
		type = {
			-- Ԫ��
			[0] = {
				name = "Ԫ��",
				sellFmtValueStr = "#G%d��Ԫ��#l",
				sellFmtPriceStr = "#G#{_MONEY%d}#l",
				sellInfo = "#G��Ҫ����Ԫ��#l",
				buyFmtValueStr = "%d��Ԫ��",
				buyFmtPriceStr = "#{_MONEY%d}",
			},
			-- ��Ǯ
			[1] = {
				name = "���",
				sellFmtValueStr = "#G#{_MONEY%d}#l",
				sellFmtPriceStr = "#G%d��Ԫ��#l",
				sellInfo = "#G��Ҫ������#l",
				buyFmtValueStr = "#{_MONEY%d}",
				buyFmtPriceStr = "%d��Ԫ��",
			}
		}
	},
	-- 1 ���̵꣬�����Ļ���ò�Ҫ�������� Server һ�� ShopID �����󣬷���Ҫ��������ݽṹ
	[1] = {
		name = "#G������158��181��#R����",
		type = {
			-- Ԫ��
			[0] = {
				name = "Ԫ��",
				sellFmtValueStr = "#G%d��Ԫ��#l",
				sellFmtPriceStr = "#G#{_MONEY%d}#l",
				sellInfo = "#G��Ҫ����Ԫ��#l",
				buyFmtValueStr = "%d��Ԫ��",
				buyFmtPriceStr = "#{_MONEY%d}",
			},
			-- ��Ǯ
			[1] = {
				name = "���",
				sellFmtValueStr = "#G#{_MONEY%d}#l",
				sellFmtPriceStr = "#G%d��Ԫ��#l",
				sellInfo = "#G��Ҫ������#l",
				buyFmtValueStr = "#{_MONEY%d}",
				buyFmtPriceStr = "%d��Ԫ��",
			}
		}
	}
}

--**********************************
-- �о��¼�
--**********************************
function x800116_OnEnumerate( sceneId, selfId, targetId )
--AddNumText( sceneId, x800116_g_ScriptId, "���빺����", 5, 1 )       --Del by Houzf in 20080811 because of TT 37697
	AddNumText( sceneId, x800116_g_ScriptId, "���빺��Ԫ��", 5, 2 )
	if IsShutout( sceneId, selfId, ONOFF_T_CSHOP ) == 0 then
		if GetConfigInfo( sceneId, "IsCloseYuanBaoSell" ) ~= 1 then
			AddNumText( sceneId, x800116_g_ScriptId, "�������Ԫ��", 5, 3 )
		end
	--	if GetConfigInfo( sceneId, "IsCloseGoldCoinSell" ) ~= 1 then       --Del byHouzf in 20080818
	--		AddNumText( sceneId, x800116_g_ScriptId, "������۽��", 5, 4 )
	--	end
	end
	AddNumText( sceneId, x800116_g_ScriptId, "��ȡԪ������", 5, 6 )
	AddNumText( sceneId, x800116_g_ScriptId, "��ȡ����", 11, 7 )
	AddNumText( sceneId, x800116_g_ScriptId, "���۽���", 11, 5 )
end

--**********************************
-- �¼��б�ѡ��һ��
--**********************************
function x800116_OnDefaultEvent( sceneId, selfId, targetId, eventId )

	local opt = GetNumText()

	if opt == 1 then
		x800116_OpenShop( sceneId, selfId, targetId, 3 )
		return
	elseif opt == 2 then
		x800116_OpenShop( sceneId, selfId, targetId, 0 )
		return
	elseif opt == 3 or opt ==4 then
		local _yes = LuaFnOpenPWBox(sceneId,selfId)
		if(_yes==1)then 
			return
		end
	elseif opt == 5 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_095}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif opt == 6 then
		LuaFnAskNpcScriptMail(sceneId, selfId, MAIL_COMMISIONSHOP)
		return
	elseif opt == 7 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_099}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	UserName	= GetName( sceneId, selfId )
	local	i, _			= strfind( UserName, "*" )
	if i == nil then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, opt )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19850424 )		
	else
		BeginEvent( sceneId )
			AddText( sceneId, "���������к��С�*������Ҫ�ȸ�����������ʹ�ü��۹��ܡ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	return
end

--**********************************
-- ��ĳ���̵�
--**********************************
function x800116_OpenShop( sceneId, selfId, targetId, Grade )
	GetCommisionShop( sceneId, selfId, targetId, Grade )
end

--**********************************
-- ����
--**********************************
function x800116_Buy( sceneId, selfId, targetId, Grade, SerialNumber )
	local ret, shopId, type, value, price, seller = CommisionShopBuy( sceneId, selfId, targetId, Grade, SerialNumber )

	if ret == 1 then
		if x800116_g_CShopInfo[shopId] and x800116_g_CShopInfo[shopId].type[type] and x800116_g_CShopInfo[shopId].name then
			local typeInfo = x800116_g_CShopInfo[shopId].type[type]
			local nameInfo = x800116_g_CShopInfo[shopId].name
			local strGUID = LuaFnGetGUID( sceneId, selfId )
			local len = strlen(strGUID)
			strGUID = strsub( strGUID, len-3 )
			local str = format( "#Iĳ��[ID:****%s]��#R%s#I��������#Y%s#I������#Y%s#I��",
				strGUID,
				nameInfo,
				typeInfo.buyFmtPriceStr,
				typeInfo.buyFmtValueStr
				 )
			str = format( str, price, value )
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
			
			local sellstr = format("�����۵�%s��#Y�ɹ��۳�#W�����ҵ�����NPCѡ����ȡԪ�����ҡ����ɻ������Ԫ�����ҡ�#r#Gע�⣺Ϊ�˱������ĲƲ���ȫ���뾡����һ������ȡ����Ԫ���ͽ�ң������һ�ܺ���û����ȡ�Ļ���Ԫ�����ҿ��ܻᶪʧ��",
			  typeInfo.buyFmtValueStr)
			sellstr = format( sellstr, value)
			LuaFnSendSystemMail(sceneId,seller,sellstr)
		end
	end
end

--**********************************
-- ����
--**********************************
function x800116_Sell( sceneId, selfId, targetId, Grade, Price )
	local ret, shopId, type, value, price = CommisionShopSell( sceneId, selfId, targetId, Grade, Price )

	if ret == 1 then
		if x800116_g_CShopInfo[shopId] and x800116_g_CShopInfo[shopId].type[type] and x800116_g_CShopInfo[shopId].name then
			local typeInfo = x800116_g_CShopInfo[shopId].type[type]
			local nameInfo = x800116_g_CShopInfo[shopId].name
			local strGUID = LuaFnGetGUID( sceneId, selfId )
			local len = strlen(strGUID)
			strGUID = strsub( strGUID, len-3 )
			local str = format( "#Iĳ��[ID:****%s]��#R%s#I��������#Y%s��#I�ۼ�#Y%s��#I���⹺��������ϻ�#G����#I�ɡ�",
				strGUID,
				nameInfo,
				typeInfo.buyFmtValueStr,
				typeInfo.buyFmtPriceStr,
				typeInfo.sellInfo,
				typeInfo.name )
			str = format( str, value, price )
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	end
end

function x800116_TimeOutCommission(sceneId,shopId,itemserial)
	local ret,type,value,price,seller = GetCommisionShopItem(sceneId,shopId,itemserial)
	
	if ret == 1 then
		if x800116_g_CShopInfo[shopId] and x800116_g_CShopInfo[shopId].type[type] then
			local typeInfo = x800116_g_CShopInfo[shopId].type[type]
			
			local sellstr = format("�����۵�%s#Yû���۳�#W�����ҵ�����NPCѡ����ȡԪ�����ҡ����ɻ������Ԫ�����ҡ�#r#Gע�⣺Ϊ�˱������ĲƲ���ȫ���뾡����һ������ȡ����Ԫ���ͽ�ң������һ�ܺ���û����ȡ�Ļ���Ԫ�����ҿ��ܻᶪʧ��",
			  typeInfo.buyFmtValueStr)
			sellstr = format( sellstr, value)
			LuaFnSendSystemMail(sceneId,seller,sellstr)
		end
	end
end
