local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
  -- 1xx Informational
  s("hcontinue", t("100")),
  s("hswitchingprotocols", t("101")),

  -- 2xx Success
  s("hok", t("200")),
  s("hcreated", t("201")),
  s("haccepted", t("202")),
  s("hnonauthinfo", t("203")),
  s("hnocontent", t("204")),
  s("hresetcontent", t("205")),
  s("hpartialcontent", t("206")),

  -- 3xx Redirection
  s("hmultiplechoices", t("300")),
  s("hmovedperm", t("301")),
  s("hfound", t("302")),
  s("hseeother", t("303")),
  s("hnotmodified", t("304")),
  s("htempredirect", t("307")),
  s("hpermredirect", t("308")),

  -- 4xx Client Errors
  s("hbadrequest", t("400")),
  s("hunauthorized", t("401")),
  s("hpaymentrequired", t("402")),
  s("hforbidden", t("403")),
  s("hnotfound", t("404")),
  s("hmethodnotallowed", t("405")),
  s("hnotacceptable", t("406")),
  s("hproxyauthrequired", t("407")),
  s("hrequesttimeout", t("408")),
  s("hconflict", t("409")),
  s("hgone", t("410")),
  s("hlengthrequired", t("411")),
  s("hpreconditionfailed", t("412")),
  s("hpayloadtoolarge", t("413")),
  s("huritooLong", t("414")),
  s("hunsupportedmedia", t("415")),
  s("hrangenotsatisfiable", t("416")),
  s("hexpectationfailed", t("417")),

  -- 5xx Server Errors
  s("hinternalerror", t("500")),
  s("hnotimplemented", t("501")),
  s("hbadgateway", t("502")),
  s("hserviceunavailable", t("503")),
  s("hgatewaytimeout", t("504")),
  s("hhttpversionnotsupported", t("505")),
})
