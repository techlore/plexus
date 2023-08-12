# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Plexus.Repo.insert!(%Plexus.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Plexus.Schemas.App

for params <- [
      %{
        name: "3DMark",
        package: "com.futuremark.dmandroid.application",
        icon_url:
          "https://play-lh.googleusercontent.com/frbnH0In-51BFco8IZE4zTJQpzfrY51_1cv0tAx46OnUIzN25CRxJrgKH5g9XNTGvA"
      },
      %{
        name: "432 Player",
        package: "com.appums.music_pitcher",
        icon_url:
          "https://play-lh.googleusercontent.com/pWUdYjGrRynv_8lBXtnjFXjKKNpzawtaF6bNfkHgHH5MB4Hy4-AuKMPZ1OcSW1Sx8215"
      },
      %{
        name: "4411",
        package: "marlon.mobilefor_4411",
        icon_url:
          "https://play-lh.googleusercontent.com/69RsSYID4GHonNNLjfEbY0rrYyCz9yC5rQ2fiInWi7_1gBXlkDhY5rTLGpLW0mLW3QTN"
      },
      %{
        name: "6ix9ine Runner",
        package: "com.game.jam.beat.saber.six.nine.music",
        icon_url:
          "https://play-lh.googleusercontent.com/hiOHmCwvY_HQDdzQ7nrzaY5dl0e-9dtnBTZVcLgMQdgrVMXO_Tafa3R2CZcH3R6tMbg6"
      },
      %{
        name: "7zipper",
        package: "org.joa.zipperplus7",
        icon_url:
          "https://play-lh.googleusercontent.com/U8NvpxdN7UHUsE8t1ux6x1eqQ--bTmSGOiIVbT5_wJ6IR29hgaja0HBrwxA5ul5D0Qc"
      },
      %{
        name: "99pay",
        package: "com.qqtrade.gugupay",
        icon_url:
          "https://play-lh.googleusercontent.com/QHeL1eYZq_c7wwcvyjGH3fbRqvHxl97F_3zGHj7xCGENzwTYWvkc68ICOGI5jr3V8pc"
      },
      %{
        name: "9GAG",
        package: "com.ninegag.android.app",
        icon_url:
          "https://play-lh.googleusercontent.com/QiE-x76mMbIxT5W2sBCdORRnz-YJys2ridssRJZmiE540_5ADuFnOg-9I0H6bTQOuw"
      },
      %{
        name: "A+ Gallery",
        package: "com.atomicadd.fotos",
        icon_url:
          "https://play-lh.googleusercontent.com/yqobWiIMCWcgZctnuOD9CHM6xzNx59bxYLgyxlOHhK4g_1szaZd2YqS4G4V7UoOpy30"
      },
      %{
        name: "ABC Listen",
        package: "com.thisisaim.abcradio",
        icon_url:
          "https://play-lh.googleusercontent.com/iiZba_ezcXR-bI8o1r7l2Pk_Dxh-m72dq7VCt_7zRay6hs1AyCmfpiQm2JvTfBEkZQ"
      },
      %{
        name: "ABN AMRO",
        package: "com.abnamro.nl.mobile.payments",
        icon_url:
          "https://play-lh.googleusercontent.com/qI_TUIRUO7VeW3x-Cf4u6tP3fIOLyRjstgNtO4fuJ64RzlbV12HnZ7p96oOrsukRLSw"
      },
      %{
        name: "AL-Chan",
        package: "com.zen.alchan",
        icon_url:
          "https://play-lh.googleusercontent.com/TqONqsZvxfbPiV06goaE8APk2KCmz-ncYYq8rTJ96SHY5Sxw3cARgrO9TRVybGYss6c"
      },
      %{
        name: "AMBOSS Medical Knowledge Library & Clinic Resource",
        package: "com.amboss.medical.knowledge",
        icon_url:
          "https://play-lh.googleusercontent.com/BOgWFJpp_ccyKiK7wgihzZxDTYUcb8T5ZQqcYzLfIaO6_ReBK4JSe7pjiZoAfniLZg"
      },
      %{
        name: "APKMirror",
        package: "com.apkmirror.helper.prod",
        icon_url:
          "https://play-lh.googleusercontent.com/04zdh0xwgkxR0kTE_pAzURKJjihHjR9Nz5RSU1R7toS9W8-QCLE1RtJBS4Csl-ueEUU"
      },
      %{
        name: "ARD Audiothek",
        package: "de.ard.audiothek",
        icon_url:
          "https://play-lh.googleusercontent.com/neTLExGt6zopMTlmz5_WatV8g3QuUxCtDjRcf40vls9WdDLhbokdPueM4Nie-EAg9A"
      },
      %{
        name: "ASB Mobile Banking",
        package: "nz.co.asb.asbmobile",
        icon_url:
          "https://play-lh.googleusercontent.com/faVTk0TwaIGkJv6R2AvAUiD93PmM682QdwQr-5p8R800cCEWT9ddIq7KsmlRy7Xf8Q"
      },
      %{
        name: "ASN Mobiel Bankieren",
        package: "nl.asnbank.asnbankieren",
        icon_url:
          "https://play-lh.googleusercontent.com/P3fSwWXfqX0B0XurJalzc9sucVyddQtaLmHk4zIkACYrvw7F2z-zKez1YNk27B7LMA"
      },
      %{
        name: "Abrecombie & Fitch",
        package: "com.abercrombie.abercrombie",
        icon_url:
          "https://play-lh.googleusercontent.com/kzZjJfzDXEGgU6E-1BQrRvQlTb34LLTiKFcJ8zFR558_wj4c06R_1HEMne25nfdVsnY"
      },
      %{
        name: "AccuBattery",
        package: "com.digibites.accubattery",
        icon_url:
          "https://play-lh.googleusercontent.com/Sp6UYHAAOVGGAyp-BOLZcVrqRoGTcj2178aJcv3sm2UkFdja-rm-stkzdYIT1eT9lg"
      },
      %{
        name: "Acrylic Nails!",
        package: "com.crazylabs.acrylic.nails",
        icon_url:
          "https://play-lh.googleusercontent.com/hb5cZrIx3qVIZU08Xj_sj8ssMDRpiy0lL8u8QFrh5Nhmn_d-pNqR2HjRraLQ3jIDA00w"
      },
      %{
        name: "Actual Budget",
        package: "com.shiftreset.actual",
        icon_url:
          "https://play-lh.googleusercontent.com/209fPBA5Q2ceVu4hIDE2x4sE3-FQPQd4lJMPWv0ckZ4yH-K6fRfRt1ZilDxG3-AmzPDX"
      },
      %{
        name: "Adobe Creative Cloud",
        package: "com.adobe.cc",
        icon_url:
          "https://play-lh.googleusercontent.com/WIVfY42FSk4naFCn42h694luehyzsifuiy2l0ok_-lFeb50qda_7j3YQdp0x2-S2_ykH"
      },
      %{
        name: "Advanced Download Manager",
        package: "com.dv.adm",
        icon_url:
          "https://play-lh.googleusercontent.com/tO-FZdbVAb7BvN1COM4Cl1liVvbEwlqLfUllCb4xIJi3EUpk_x6lg8FKiKxpLIeHD2Hz"
      },
      %{
        name: "Afterpay",
        package: "com.afterpaymobile.us",
        icon_url:
          "https://play-lh.googleusercontent.com/oskHthu3lKoi9dqbZ2uRt0r2iZgvsaRKbM9v9WFun97E5USLGXfBIg3hPR5jrC9dLQ4a"
      },
      %{
        name: "Aggregator",
        package: "com.tughi.aggregator",
        icon_url:
          "https://f-droid.org/repo/com.tughi.aggregator/en-US/icon_f9vXPzgTq36bXPT1W3Z16NPr3NBOJ_8OKO0YbrN3pIs=.png"
      },
      %{
        name: "Air NZ",
        package: "nz.co.airnz.mpass",
        icon_url:
          "https://play-lh.googleusercontent.com/HvhKHOeg1Fi66z_e8OXB67sL9ZS86luVBgDwnw1wXcKVt4dUMr3s5hvAiSMqkPtCfpQ"
      },
      %{
        name: "AirMessage",
        package: "me.tagavari.airmessage",
        icon_url:
          "https://f-droid.org/repo/me.tagavari.airmessage/en-US/icon_l_5jB5p7hedLxwxeID5M5wtr2HJIGwHE85ZrjhTLAgU=.png"
      },
      %{
        name: "Airbnb",
        package: "com.airbnb.android",
        icon_url:
          "https://play-lh.googleusercontent.com/1zfN_BL13q20v0wvBzMWiZ_sL_t4KcCJBeAMRpOZeT3p34quM-4-pO-VcLj8PJNXPA0"
      },
      %{
        name: "Airport Control",
        package: "com.nexgen.airportcontrol",
        icon_url:
          "https://play-lh.googleusercontent.com/AVpdTIjN3MBI52tvB7t7awjbgHrNbdsmTv6jlewmCyhpziYCoiUbODyXQrVWXowhyA4"
      },
      %{
        name: "Airtel Thanks",
        package: "com.myairtelapp",
        icon_url:
          "https://play-lh.googleusercontent.com/MEDyPtE2OFyPqXh2m_K5iQT3jvzIC93vdlRQC5O8kjr5_GAkFeNbmroPVrpbJT8bocM"
      },
      %{
        name: "Al Jazeera English",
        package: "net.aljazeera.english",
        icon_url:
          "https://play-lh.googleusercontent.com/1pvYY4tIk0u0ZPkqp-zMRHXekDNq793b5TNxFO0ZUMe2ML87G6moZrvfiVWFWteEUirC"
      },
      %{
        name: "Alfred Camera",
        package: "com.ivuu",
        icon_url:
          "https://play-lh.googleusercontent.com/i9bg7JhvgRqNsvs3pULuKhVutUpTbFSeCbxF-gOIp3tdM1ucP5LYTBobmEDXPxQTpQ"
      },
      %{
        name: "Alipay",
        package: "com.eg.android.AlipayGphone",
        icon_url:
          "https://play-lh.googleusercontent.com/xV6gK4t0SF7AW4LK3slUzj4WIY1SfzRtq-zFTygFSO9wg-JXTJImEi34rrxhsRutXQ"
      },
      %{
        name: "Alto's Adventure",
        package: "com.noodlecake.altosadventure",
        icon_url:
          "https://play-lh.googleusercontent.com/gxylrEt14mAOWhHLJbuHg7lIa3h8t5tLbXcCZL_ox437C4UVO7Euk9rj6fjGLUdnTWw"
      },
      %{
        name: "Amazon Kindle",
        package: "com.amazon.kindle",
        icon_url:
          "https://play-lh.googleusercontent.com/48wwD4kfFSStoxwuwCIu6RdM2IeZmZKfb1ZeQkga0qEf1JKsiD-hK3Qf8qvxHL09lQ"
      },
      %{
        name: "Amazon Music",
        package: "com.amazon.mp3",
        icon_url:
          "https://play-lh.googleusercontent.com/7CJqz69aGFnVCov8jv5rfvHDb19pK1KSycv3cFPPNuG9mPIqMiMkxgCVDhQUV2LwlpBj"
      },
      %{
        name: "Amazon Prime Video",
        package: "com.amazon.avod.thirdpartyclient",
        icon_url:
          "https://play-lh.googleusercontent.com/Y7drWZZo_F2GBE1RhjR1irOkE3yrtPorHS1U9YkLKAu1DnTjQ8gNbcRmrBtkd3tnHQ"
      },
      %{
        name: "Amboss Wissen fur Mediziner",
        package: "de.miamed.amboss.knowledge",
        icon_url:
          "https://play-lh.googleusercontent.com/FGnqdsv5qZBp5n7QOd5C2nivTwxXgT5ZHVTUKs-f-AE4TMkKOV42PuZmes-tjUKBKPZn"
      },
      %{
        name: "Amegy Bank",
        package: "com.bitbuilders.zions.amegy",
        icon_url:
          "https://play-lh.googleusercontent.com/BgoTK-sUOmHvAUqO16xqGMr0yyDBcHnyY17bU1A3kano3BRbt1efQOJ2OozuCVHiXWM"
      },
      %{
        name: "American Eagle AE + Aerie",
        package: "com.ae.ae",
        icon_url:
          "https://play-lh.googleusercontent.com/pZBIqxTLgIQ9U4nBgkyOJa462mN-NedqpA9EzDuCFUTDcSPNKBsEjnsUrKjt6ktjU7rV"
      },
      %{
        name: "Among Us",
        package: "com.innersloth.spacemafia",
        icon_url:
          "https://play-lh.googleusercontent.com/8ddL1kuoNUB5vUvgDVjYY3_6HwQcrg1K2fd_R8soD-e2QYj8fT9cfhfh3G0hnSruLKec"
      },
      %{
        name: "Angry Birds 2",
        package: "com.rovio.baba",
        icon_url:
          "https://play-lh.googleusercontent.com/nDXdk5wKKYXgqyGYAOn-RlL71bFoIEI2PlVKfi1-7A3n5p89FqRGpVXjFWBbDKoP-A"
      },
      %{
        name: "Angry Birds AR: Isle of Pigs",
        package: "com.rovio.abar",
        icon_url:
          "https://play-lh.googleusercontent.com/RLEeC8_6fkqsT0GL4QxSQu2n0KaUhVhjqYZA-I7ooheAFX-Ydc4U--4J8MGBabMeug"
      },
      %{
        name: "AniTrend",
        package: "com.mxt.anitrend",
        icon_url:
          "https://play-lh.googleusercontent.com/mqcyOqt80TzJ4H42lB0mOTuV6GhhOVv_2POsEQdcoEPMS05akX4AojQW42eLFVanYr0"
      },
      %{
        name: "Ankidroid",
        package: "com.ichi2.anki",
        icon_url:
          "https://play-lh.googleusercontent.com/4aLlAwUKGg5Keo8zz-pPI1QS9KnjSsa3vKX2NINqq5Fv1jfPK3bl6ghLaZ371OcH9A"
      },
      %{
        name: "AntennaPod",
        package: "de.danoeh.antennapod",
        icon_url:
          "https://f-droid.org/repo/de.danoeh.antennapod/en-US/icon_OH4TXWSQZ716A97yM9y87Gy65l3w19qzHcH-RfkE7xw=.png"
      },
      %{
        name: "AnySoftKeyboard",
        package: "com.menny.android.anysoftkeyboard",
        icon_url:
          "https://f-droid.org/repo/com.menny.android.anysoftkeyboard/en-US/icon_b0e1nApQqv5tCfE6LcKIvFrAhuzbJ4kYkYsD2jho9J0=.png"
      },
      %{
        name: "Anydesk",
        package: "com.anydesk.anydeskandroid",
        icon_url:
          "https://play-lh.googleusercontent.com/raHvIVqJ1ELefflInCw8h2Dtm-8FAHMauAhet-XA6cQuE1-NPmsAe5-10Rz3-Iwr"
      },
      %{
        name: "Apple Music",
        package: "com.apple.android.music",
        icon_url:
          "https://play-lh.googleusercontent.com/mOkjjo5Rzcpk7BsHrsLWnqVadUK1FlLd2-UlQvYkLL4E9A0LpyODNIQinXPfUMjUrbE"
      },
      %{
        name: "Argenta",
        package: "be.argenta.bankieren",
        icon_url:
          "https://play-lh.googleusercontent.com/Qpl8t2yJhMjSHaeyZX8cs5cIV8AePg2Qj726-Zt5IlvPJie1H-E5ipvUhsJ7i2tRWKU"
      },
      %{
        name: "Arlo",
        package: "com.arlo.app",
        icon_url:
          "https://play-lh.googleusercontent.com/4BIUELdP80ereYzRJh0s1QrmLksL35zNbAVDXkXp5C915MRq3rUxie84EAx7F0a6djXQ"
      },
      %{
        name: "ArubaPEC",
        package: "it.aruba.pec.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/lOgWYZWMBPC8uRoqiYSZMgkN401W-kTM2lP6juJC9Y8-lRqOTl9pVuSC-mW1G_3ZyQ"
      },
      %{
        name: "Asphalt 8",
        package: "com.gameloft.android.ANMP.GloftA8HM",
        icon_url:
          "https://play-lh.googleusercontent.com/y1J3-OrqJIlezTtaung2sPOnHY9wS2hdJh26ADkwcc3kdZy4DTGyv94IN_YRvdKy0y4"
      },
      %{
        name: "Audible",
        package: "com.audible.application",
        icon_url:
          "https://play-lh.googleusercontent.com/pwzZK-7oQexraeU0mOrQgFIck-QSS89rH0eWjehctp8XskRSpixPNVlA0YYlRXHbA2Iz"
      },
      %{
        name: "Australia Post",
        package: "au.com.auspost.android",
        icon_url:
          "https://play-lh.googleusercontent.com/dHYiIxaJ--OJjPesfznCtX3aO6Z859I_t2axvzNrJkFbzb6_M58QGUx8QMGzNGfsHas"
      },
      %{
        name: "Authy",
        package: "com.authy.authy",
        icon_url:
          "https://play-lh.googleusercontent.com/NxyEuJRx4jjR1Q9PXOPGExFQXDKr_pZJ61Cb15eR0aX3UTZKAxWsXvK9Gh4K-NUd5A"
      },
      %{
        name: "AutoTagger",
        package: "com.serg.chuprin.tageditor",
        icon_url:
          "https://play-lh.googleusercontent.com/j1egjrZCjyTC-bUdx28Hk5a9T6Zue6ho3Fy-WTdrOCAV78qmum7BiuM18OhYzY6hMg"
      },
      %{
        name: "Axios registro elettronico famiglie",
        package: "com.axiositalia.re.family",
        icon_url:
          "https://play-lh.googleusercontent.com/iN2Pc1GMSnT2ons8-0cf5PNZoalSrpUQ7ahoap1fUNOBFCS4fo91F422eGF5Sv25b78"
      },
      %{
        name: "BBC News",
        package: "bbc.mobile.news.ww",
        icon_url:
          "https://play-lh.googleusercontent.com/Iip-8Yn3PLAzecCMb4ZaHTvFObl3ETUWZmd5zLflhbB6BXKyNc5aM4hrGAA9NXSs7i0"
      },
      %{
        name: "BBVA Mexico",
        package: "com.bancomer.mbanking",
        icon_url:
          "https://play-lh.googleusercontent.com/ZxkWMlaMeFNPsUjVU_I6VIBtUij2RTdFUI4dsPz4sgXHvvtaTu2Q86DhmCq4HVFfyHA"
      },
      %{
        name: "BHIM UPI",
        package: "in.org.npci.upiapp",
        icon_url:
          "https://play-lh.googleusercontent.com/B5cNBA15IxjCT-8UTXEWgiPcGkJ1C07iHKwm2Hbs8xR3PnJvZ0swTag3abdC_Fj5OfnP"
      },
      %{
        name: "BOM Weather",
        package: "au.gov.bom.metview",
        icon_url:
          "https://play-lh.googleusercontent.com/fnC21Kh-cDG5u1h0vOXv5bFECWHOX2pjkcl_N4zCB3ZrmvNGKDE_LNex9vTBHPSlHz_1"
      },
      %{
        name: "BRD Bitcoin Wallet",
        package: "com.breadwallet",
        icon_url:
          "https://play-lh.googleusercontent.com/-2cevFNM9hAjRVMjlthiTDi6VfJ2eA_rPOQw6_-Pa-zx62OZZah95rwppztU2aDvtHZn"
      },
      %{
        name: "BTS WORLD",
        package: "com.netmarble.btsw",
        icon_url:
          "https://play-lh.googleusercontent.com/NTmvsKXWw-JkNC49_rniv8Rhk0nrTBHLUoiiehFoBCdVaghXebAWcXGZoKTcog7_r1U"
      },
      %{
        name: "Ballz",
        package: "com.ketchapp.ballz",
        icon_url:
          "https://play-lh.googleusercontent.com/2O5xqUoPbtogweyacizqwLEJZ0-rb2pS3flqGreHM6a6G2q7PKj-5niPiiMkNUdNuw"
      },
      %{
        name: "Banco Inter",
        package: "br.com.intermedium",
        icon_url:
          "https://play-lh.googleusercontent.com/AligYOLFCEgIqp43l21EyhdEepb8ivZBdy2n7Ltg25b18zn15yVs1Uz3CqTDGQdtr4g"
      },
      %{
        name: "Banco Inter Empresas",
        package: "br.com.Inter.CDPro",
        icon_url:
          "https://play-lh.googleusercontent.com/J5UTNa224JkpSJF4uNbJ7KfuVz6P3IoUpkP-brLPfWAtXvz0mWr2zUGu7tcTZcwt1_o"
      },
      %{
        name: "Banco Itau",
        package: "com.itau",
        icon_url:
          "https://play-lh.googleusercontent.com/CyP_f9VxfdTyixcWO_-2IW5cJ1M8adkqRrY9Wo_CkH0Ixj12qdg1SJHpuye-9n_YYqM"
      },
      %{
        name: "Banco do Brasil",
        package: "br.com.bb.android",
        icon_url:
          "https://play-lh.googleusercontent.com/1-aNhsSPNqiVluwNGZar_7F5PbQ4u1zteuJ1jumnArhe8bfYHHaVwu4aVOF5-NAmLaA"
      },
      %{
        name: "Bandcamp",
        package: "com.bandcamp.android",
        icon_url:
          "https://play-lh.googleusercontent.com/bShqpc5_RKyKRzOx1c4rWBhrhDXAM-TgmAz1eZNSme6bIbdrmPjSoxzdBLejeXsawMQ"
      },
      %{
        name: "Bank of America",
        package: "com.infonow.bofa",
        icon_url:
          "https://play-lh.googleusercontent.com/GdICLxnKd-e-lmV46N_SjihWHzAUX1nj8e--dF2KrQjvomN4zxOR-iEWwsTG_Tqr_oc"
      },
      %{
        name: "Bank of Ireland Mobile Banking",
        package: "com.bankofireland.mobilebanking",
        icon_url:
          "https://play-lh.googleusercontent.com/iraUBoPgVS_e-fIJHV9dsJK4GR8HX-7_nkSKbGDbP4VXrBBI8VTiAWa70qgxH7GLcnk"
      },
      %{
        name: "BankID",
        package: "com.bankid.bus",
        icon_url:
          "https://play-lh.googleusercontent.com/V1dkOTY_G9orFZHFtVYrDN-pbz1SGLM4D3RjjAL1WgEAhXVZa4o6O9mU09dJU1x5Ao8"
      },
      %{
        name: "Banorte Movil",
        package: "net.bac.sbe.android",
        icon_url:
          "https://play-lh.googleusercontent.com/EO8hog6JS_5XqgZvFU-hBt38pAqbUcKybtXlZybz6ZtwHPYaUmBuOBlzEZi6E80qhjg"
      },
      %{
        name: "Banrisul",
        package: "br.com.banrisul",
        icon_url:
          "https://play-lh.googleusercontent.com/EesIfzYxpFnep4xcOBAV7uyhx_L4gvfcCN2eatEDSxW6yjy75Q8MmLQNasQ20J585D4"
      },
      %{
        name: "Barclays",
        package: "com.barclays.android.barclaysmobilebanking",
        icon_url:
          "https://play-lh.googleusercontent.com/1U3nHP3cS5s8yNuIH4ECo-5bi_lUJ4dZyxO2HPCZSrlPeVAE5UQSIszDt__3fv36GK8"
      },
      %{
        name: "Battle of Polytopia",
        package: "air.com.midjiwan.polytopia",
        icon_url:
          "https://play-lh.googleusercontent.com/YO8BbfRsuDk3pr_NqXQfvg4A3l6z6I0xSqR4GMy3mABs9twhdVbabGQ4tDi-yETQQ4c"
      },
      %{
        name: "Beats",
        package: "com.apple.bnd",
        icon_url:
          "https://play-lh.googleusercontent.com/M69NNlG5X8rSh4xJXVlexwff-nWscILWHrtDpflRqcLlt9xavgZf-20PszMAKJ50I4c"
      },
      %{
        name: "Berichtenbox",
        package: "nl.rijksoverheid.mbb.pub",
        icon_url:
          "https://play-lh.googleusercontent.com/PThkE-LPjdybM5bDXwaemO5BI1heRD9w9faosbUN-xhdVCBUoy6hzARxosl8c1LrrA"
      },
      %{
        name: "BestSecret",
        package: "com.bestsecret.main",
        icon_url:
          "https://play-lh.googleusercontent.com/szFxp3snVvYPkXwt-Gcf7mnl697Uy0NbpJBKU9XZid4ld-X8eCssJKvLPtsrwmsMGw"
      },
      %{
        name: "Binance US",
        package: "com.binance.dev",
        icon_url:
          "https://play-lh.googleusercontent.com/T1_WHAGs5WZePQejNSqqrxZah4uhBvYr698nTCFhXMjMZo5oSCoko5yW2wtmeO1ClRU"
      },
      %{
        name: "Bing Search",
        package: "com.microsoft.bing",
        icon_url:
          "https://play-lh.googleusercontent.com/kmxAt02yG8Hp-TzZHDoRGFtB70QFz7njpWQzQp8KANztd-DozlJipu8tprSn80Q8pw"
      },
      %{
        name: "BirdNET",
        package: "de.tu_chemnitz.mi.kahst.birdnet",
        icon_url:
          "https://play-lh.googleusercontent.com/m1xvI9w2cRNDESdNpw3vYsQmyDUpaUCIwolZ4Yg-Ie_c6Ka3LJho8cU1oACpAjPbrhM"
      },
      %{
        name: "Bitmoji",
        package: "com.bitstrips.imoji",
        icon_url:
          "https://play-lh.googleusercontent.com/TdM1HpnaHHY3MIGHt_gEzrP85nTdCcWxfqG4S5223aslDu8IzksaDOs72ISMyHRi6V8"
      },
      %{
        name: "Bitwarden",
        package: "com.x8bit.bitwarden",
        icon_url:
          "https://play-lh.googleusercontent.com/-jz18EgBYlmeHlnsq_iltq6uLnYFtXAVR_gi_d0qEj0pANQ1MtrJIstJoCQtImlWKwc"
      },
      %{
        name: "BlackPlayer",
        package: "com.musicplayer.blackplayerfree",
        icon_url:
          "https://play-lh.googleusercontent.com/ydi6YT7fseMtxW6BtPloTbM5sOh8N8uTlQJSuoiDgkV3QcnmWKJf_6y2MTtLd5Imc2RC"
      },
      %{
        name: "Bloons TD Battles",
        package: "com.ninjakiwi.bloonstdbattles",
        icon_url:
          "https://play-lh.googleusercontent.com/LeZ9qnLV9Sc8dM0nzQrKPoEsrOiT5mpEYFIs91ztvcq3NWZNJBA2e0U7UsG4WNRxyeA"
      },
      %{
        name: "BlueDriver OBD2 Scan Tool",
        package: "com.lemurmonitors.bluedriver",
        icon_url:
          "https://play-lh.googleusercontent.com/kMlEIv22GVt4I_5mX-80VnBD_RQq2uJlig-3H6wVEaF15BO_O1Bqyz1Y_c_eylotqw"
      },
      %{
        name: "BlueMail Lite",
        package: "me.bluemail.lite",
        icon_url:
          "https://play-lh.googleusercontent.com/Fv3u-KL2o-7dnHDGT362f6hin72b65htfepHHLGA7s6t0yvHV9PEGiOA7w7XJtUXxl2y"
      },
      %{
        name: "Bolt",
        package: "ee.mtakso.client",
        icon_url:
          "https://play-lh.googleusercontent.com/TRCKh9Uk5mME5lVDZBAVmBMyBEiumHw4Ef9MTAnRqgcK8MEr4M8jqqBDGX_pKVBffpo"
      },
      %{
        name: "Boom Beach",
        package: "com.supercell.boombeach",
        icon_url:
          "https://play-lh.googleusercontent.com/y_Dr51TrM3NfJO-bFECbGVXsjfFYo-6YjiJfIQwyNBX6VdBW8H8eSEZzpCXcGKKByyw"
      },
      %{
        name: "Boost for Reddit",
        package: "com.rubenmayayo.reddit",
        icon_url:
          "https://play-lh.googleusercontent.com/GF71STDEmTKhbEexCYbePXAjYym_ee8E6WR7_R8jr5_Xf10jfL0Kibkjfl33zDrJBw"
      },
      %{
        name: "Bose Connect",
        package: "com.bose.monet",
        icon_url:
          "https://play-lh.googleusercontent.com/fIkhC2mTqVTsjb8XnI42ALyyLX8bYAWbO5REr6i26y7bhmNulIRY1AhmUDrUmdImpQ"
      },
      %{
        name: "Bose SoundTouch",
        package: "com.bose.soundtouch",
        icon_url:
          "https://play-lh.googleusercontent.com/Zygxp6S2mgdh3GMY8kV4AtrZYcDBshH5yaymnU3FnCQq2PC7hQYv4wa1PR6O4vH02Cc"
      },
      %{
        name: "Boursorama Banque",
        package: "com.boursorama.android.clients",
        icon_url:
          "https://play-lh.googleusercontent.com/EGJ0vX2zApGrOr2Pn7xDI8ZB6cFQ3fzjATnFRJp43h7pZkWllJpVhgRPO3eTBV-TCjw"
      },
      %{
        name: "Brave",
        package: "com.brave.browser",
        icon_url:
          "https://play-lh.googleusercontent.com/I1foi2Irrv7tW9ee9kgP0wfnMzaVb6y17muvpKsFcUrKYsDlmCyWuTRh5m93KJZ24dY"
      },
      %{
        name: "Budbee",
        package: "com.budbee.tracking",
        icon_url:
          "https://play-lh.googleusercontent.com/s-AevBhUMCMs9In-VpEtsDwgmq_YqvfCsk3PAkJISmKKgOlPG0Hc2a1FL5ymOFIQQak"
      },
      %{
        name: "Budget plannerExpense tracker",
        package: "com.colpit.diamondcoming.isavemoney",
        icon_url:
          "https://play-lh.googleusercontent.com/2VaPA06HyAdBriAyqawivmyifgEVblRge-z5dD8wcJy6K3icNt4PkvA0H2EINHjZTA"
      },
      %{
        name: "Bumble",
        package: "com.bumble.app",
        icon_url:
          "https://play-lh.googleusercontent.com/tH2ui3MqYnTyt7EG9S3DVNDO7SV7eRtts2phjaE-vZNBvf4meAx5_a5LZc_IbZGAFw"
      },
      %{
        name: "Button Mapper by flar2",
        package: "flar2.homebutton",
        icon_url:
          "https://play-lh.googleusercontent.com/nsmWhzYhXDbxGqE-Z9iUFFQXuFJqtaEgucwCVMoozpnUSkjkyxBVe2pPXG3WSbqN6Q"
      },
      %{
        name: "CIBC Mobile Banking",
        package: "com.cibc.android.mobi",
        icon_url:
          "https://play-lh.googleusercontent.com/I7oMrRXJBEV0kprZtTGSh1Kj8_D1U8Vptgv1lEOJRBFwGNYQ21meIhqKzjajVdSh3g"
      },
      %{
        name: "CIC",
        package: "com.cic_prod.bad",
        icon_url:
          "https://play-lh.googleusercontent.com/Q6bnXvN-RsXNOvJ2XPW9aLjfkxWq1H-SbYnkJQdKfnbvJd1He8cPCILg_uOnWMfL9vI"
      },
      %{
        name: "CSR Racing",
        package: "com.naturalmotion.csrracing",
        icon_url:
          "https://play-lh.googleusercontent.com/9444XLom5uCuPCIUuAtBGr8k92-_80ZU1j_7aPFEs6x9OX6x4pHAnmqY0h5encKBf7SE"
      },
      %{
        name: "CSR Racing 2",
        package: "com.naturalmotion.customstreetracer2",
        icon_url:
          "https://play-lh.googleusercontent.com/I8MW7xOKHst-IlVluWYyPFF4-jQR9Hp2pM8SIJmVxYdkvLFkF1ofNr4G-9AM58ZisX4"
      },
      %{
        name: "CX File Explorer",
        package: "com.cxinventor.file.explorer",
        icon_url:
          "https://play-lh.googleusercontent.com/JE8mALosCn5ShZ1JW-rZYlaFP9CXs-wNBTqUalhQT6f4LpQtUqybp305E3hSruPtHJQ"
      },
      %{
        name: "Cabify",
        package: "com.cabify.rider",
        icon_url:
          "https://play-lh.googleusercontent.com/cD-_QuzaXqANt_tmczxXccqUlHJ1fJnPA0KAwJLdq8F8rsonSB-c1HxuURtNFNIHQd0"
      },
      %{
        name: "Caixa",
        package: "br.com.gabba.Caixa",
        icon_url:
          "https://play-lh.googleusercontent.com/ubV0x2kGJIEe10shxuFnH9Cy21OgHARwVUZ89nyE0YOZN9c25ov_dyHdk1rMgbPvoDI"
      },
      %{
        name: "Cake Wallet",
        package: "com.cakewallet.cake_wallet",
        icon_url:
          "https://play-lh.googleusercontent.com/rT8PU2U9iV_ZB70e1gm7qRZ2PoxAfqHIZJWpEUb-o_Quml14Xr1yOJhia8VD8ulNyofn"
      },
      %{
        name: "Calculator++",
        package: "org.solovyev.android.calculator",
        icon_url: "https://f-droid.org/repo/icons-640/org.solovyev.android.calculator.158.png"
      },
      %{
        name: "Call a Bike",
        package: "de.bahn.callabike",
        icon_url:
          "https://play-lh.googleusercontent.com/U7159V-e0j3oayEUTEVKIdZr0n7hWDh3RZemc3NwNURT5-55_mZFJ2sDRGh58mr14R7e"
      },
      %{
        name: "Calm",
        package: "com.calm.android",
        icon_url:
          "https://play-lh.googleusercontent.com/S76GphUu2pZa249td2Bb4XAhLcPRrFdL1zp_5qU1ouukvRq9r0-8jJ-CruaTtdT6g84"
      },
      %{
        name: "CamScanner",
        package: "com.intsig.camscanner",
        icon_url:
          "https://play-lh.googleusercontent.com/ni3wAWWlHftm10UY13L40-OnqARy_MZqyB5ppIBHgXBf47YQT1h-72fkBvGmt5D65Q"
      },
      %{
        name: "Camera Adversaria",
        package: "com.kieranbrowne.cameraadversaria",
        icon_url:
          "https://play-lh.googleusercontent.com/tuQaDYo9HmSFqXBF3e2qcKy9CPifWeMebPXhJ4P3EsMHSUjnalpzGoGUVjqFEIhuwA"
      },
      %{
        name: "Camera Go",
        package: "com.nerovero.camerago",
        icon_url:
          "https://play-lh.googleusercontent.com/MebokuR9yHGgsJ3eUOZ7PaHM2-fWetCXRL222IV8AmjlQ-LxuTsVZKVwF3BC9ZtxLMS4"
      },
      %{
        name: "Camo",
        package: "com.reincubate.camo",
        icon_url:
          "https://play-lh.googleusercontent.com/Do407bXU4VtHXbuF1Z_gZYqjvHOmlG52lZLCuNGA9S0J-nYL-vNmthhPQiyZ2bjhF84"
      },
      %{
        name: "Candy Crush",
        package: "com.king.candycrushsaga",
        icon_url:
          "https://play-lh.googleusercontent.com/TLUeelx8wcpEzf3hoqeLxPs3ai1tdGtAZTIFkNqy3gbDp1NPpNFTOzSFJDvZ9narFS0"
      },
      %{
        name: "Canon PRINT Inkjet/SELPHY",
        package: "jp.co.canon.bsd.ad.pixmaprint",
        icon_url:
          "https://play-lh.googleusercontent.com/CL2URS2mlzwo5VrG4gfAXwdEhZJz9O6ByiciWljhyelGXInUDqCLEd807h-G2tKC-jw"
      },
      %{
        name: "Canvas Student",
        package: "com.instructure.candroid",
        icon_url:
          "https://play-lh.googleusercontent.com/2_M-EEPXb2xTMQSTZpSUefHR3TjgOCsawM3pjVG47jI-BrHoXGhKBpdEHeLElT95060B"
      },
      %{
        name: "CapCut",
        package: "com.lemon.lvoverseas",
        icon_url:
          "https://play-lh.googleusercontent.com/MO4jVMbqskWrBD7BDUiKkymLPDMlSFjnEE-JTCigWv6UcoENgAkSKr8bs0IvPs8Twv8"
      },
      %{
        name: "Car Scanner",
        package: "com.ovz.carscanner",
        icon_url:
          "https://play-lh.googleusercontent.com/X2HRiBLZzH77P7uCL4dBhbbkrXSYx0YyUIC8CDSxGHDTqidymUtsxhYQJqyQS1_d_LE"
      },
      %{
        name: "Card Wars",
        package: "com.bombayplay.cardbattle",
        icon_url:
          "https://play-lh.googleusercontent.com/h0dY0M2c5qbfhALQhHvZDG7HB_q4Sod_UWGSRlMldp5SkUwpMBt7p3r8S5brfMlqhIs"
      },
      %{
        name: "Carteira Digital de Transito",
        package: "br.gov.serpro.cnhe",
        icon_url:
          "https://play-lh.googleusercontent.com/YCcJqhni2YNUA6PlrPijw2CHxaEFGRN4nwooOTdHtN8jr3SzDos6Bb_xzYu07xOvBKhL"
      },
      %{
        name: "Carx Drift Racing 2",
        package: "com.carxtech.carxdr2",
        icon_url:
          "https://play-lh.googleusercontent.com/KJ8_UwiIpZ8gbrs2RNXOHy61x-KJqlK8cwYyiJWaw2KFJWbQMimBwyYjwxS6ishBejg"
      },
      %{
        name: "CashApp",
        package: "proxima.easymoney.android",
        icon_url:
          "https://play-lh.googleusercontent.com/pgc_1YjhUxd1WvkFlpHiNQuGxsYsTq9h_siRetXeo8YK4C37e5GKiyEmI11-qK9dww"
      },
      %{
        name: "China Daily",
        package: "com.theotino.chinadaily",
        icon_url:
          "https://play-lh.googleusercontent.com/eogRL3nP38PWZn3DfDS3nYAtPQbmKMWJre1OTcCLgsjlh35u3UNMEYfb_rFvegYmgg"
      },
      %{
        name: "Cisco JABBER",
        package: "com.cisco.im",
        icon_url:
          "https://play-lh.googleusercontent.com/8SJwWIlSqvTU_zBEOht4diByqRNgzGlVNh0qlv8B69cm1qevWgDGTx5DRb8s_0-EtaW8"
      },
      %{
        name: "Cisco WEBEX",
        package: "com.cisco.wx2.android",
        icon_url:
          "https://play-lh.googleusercontent.com/tFFAvb_eZM5BlHYFiuyVwhM54o7mvfCOFX3AGbgTULfKpEancPmZnP1PRu44CZiZgyI"
      },
      %{
        name: "Citra Emulator",
        package: "org.citra.citra_emu",
        icon_url:
          "https://play-lh.googleusercontent.com/VQt_z3nSGf3ZZRuYnDpSHfWws7Qa61-qNQpsgnrbhSox7icoAhYV5M2dkRoUtGHpqA"
      },
      %{
        name: "Citrix Secure Hub",
        package: "com.zenprise",
        icon_url:
          "https://play-lh.googleusercontent.com/Xwz5gIs3xBYeW0rFOyieUrSp8AkeYcvHVqvcrJ6kQNmRRB_2GGoUmg5idLrsX4l_w6M"
      },
      %{
        name: "Citymapper",
        package: "com.citymapper.app.release",
        icon_url:
          "https://play-lh.googleusercontent.com/vi-NYlyPamuq8frdW7sQR9YPxOKaUyPPe3y3OeJk6tuCZfQQGa-g_dShVXBn4YnzPr69"
      },
      %{
        name: "Clash Royale",
        package: "com.supercell.clashroyale",
        icon_url:
          "https://play-lh.googleusercontent.com/rIvZQ_H3hfmexC8vurmLczLtMNBFtxCEdmb2NwkSPz2ZuJJ5nRPD0HbSJ7YTyFGdADQ"
      },
      %{
        name: "Clash of Clans",
        package: "com.supercell.clashofclans",
        icon_url:
          "https://play-lh.googleusercontent.com/LByrur1mTmPeNr0ljI-uAUcct1rzmTve5Esau1SwoAzjBXQUby6uHIfHbF9TAT51mgHm"
      },
      %{
        name: "Clockify Time Tracker",
        package: "me.clockify.android",
        icon_url:
          "https://play-lh.googleusercontent.com/Q5imJq8EfMUoym8vw5BVBuJGBR3buBTWnYrOIfPou2vAfh2W5y627ZGltRJ0gz12JXM"
      },
      %{
        name: "CloudEdge",
        package: "com.cloudedge.smarteye",
        icon_url:
          "https://play-lh.googleusercontent.com/9iyYpwR5Km9GDhEyg6YxqaN111pMA7ohhX005Vaaw9jd2uvdRnkh3gArS7BCdT0NjVQd"
      },
      %{
        name: "CoinDCX Pro",
        package: "com.coindcx",
        icon_url:
          "https://play-lh.googleusercontent.com/tgvVAB_RfIlaPhZVT4tPP58WxXWQhkJeyScXbxQCvRH7oBsYQmaj8toZ8BC3MfLaIQ"
      },
      %{
        name: "Coinbase",
        package: "com.coinbase.android",
        icon_url:
          "https://play-lh.googleusercontent.com/PjoJoG27miSglVBXoXrxBSLveV6e3EeBPpNY55aiUUBM9Q1RCETKCOqdOkX2ZydqVf0"
      },
      %{
        name: "Coinbase Pro",
        package: "com.coinbase.pro",
        icon_url:
          "https://play-lh.googleusercontent.com/hi0SSeYyAbDcl1UTDVit1Or4noRiBwuNi-rAZ6QAEnGFQcZDZEIMKYkH5pbY5fn4SA"
      },
      %{
        name: "Coinbase Wallet",
        package: "org.toshi",
        icon_url:
          "https://play-lh.googleusercontent.com/wrgUujbq5kbn4Wd4tzyhQnxOXkjiGqq39N4zBvCHmxpIiKcZw_Pb065KTWWlnoejsg"
      },
      %{
        name: "Collabora Office",
        package: "com.collabora.libreoffice",
        icon_url:
          "https://play-lh.googleusercontent.com/_9QNPKueUzrp63WOa-KtDK3qJvitUi8vXmDUATdpmtUgVQF9_YAbyRBvB2QliUc9_q4"
      },
      %{
        name: "Collins Bird Guide",
        package: "com.natureguides.birdguide",
        icon_url:
          "https://play-lh.googleusercontent.com/9kWznIOhjPZMzfiRECgMlNYi_GZpFCKUCCBfJqWtWKYfK6QlwtVPBY51gCdp315UtJg"
      },
      %{
        name: "Colombia Radios",
        package: "com.viverit.colombiaradios",
        icon_url:
          "https://play-lh.googleusercontent.com/n7H98Zf_xPHjVryR-OKacfc4Afp-JUrBgBaTaAUz4Yvtgp7a5liJOr20ulYhUDCTSO0c"
      },
      %{
        name: "ColorNote Notepad Notes",
        package: "com.socialnmobile.dictapps.notepad.color.note",
        icon_url:
          "https://play-lh.googleusercontent.com/IDOtRhsZLSG3EFxWxmWREMPa42_SNQvl9-x4FBu5dn9aJMjpVtMx_GoNdnQwEIp_7gsV"
      },
      %{
        name: "Comdirect photoTAN App",
        package: "com.comdirect.phototan",
        icon_url:
          "https://play-lh.googleusercontent.com/o1o7uahFM8KkhVav6zAHi7lshOaKvJo_3F7rcIvc7WrYRYCTv6TW4zWT7TVag_QYEe4"
      },
      %{
        name: "CommSec",
        package: "au.com.commsec.android.CommSec",
        icon_url:
          "https://play-lh.googleusercontent.com/UImERnwo15jOX4_erK7-bUrRotFyQPvNpbrWef-tXPK5Jxhcdewnj3B5TpSy2XUHink"
      },
      %{
        name: "Commbank",
        package: "com.commbank.netbank",
        icon_url:
          "https://play-lh.googleusercontent.com/NYOH1_CAp-jiFzmfU6xcpQXvxQQ_w0L-J-RsEvguxr50iGdughwpoPKIst-8PjHPPQ"
      },
      %{
        name: "Commerzbank Banking",
        package: "de.commerzbanking.mobil",
        icon_url:
          "https://play-lh.googleusercontent.com/LzjNbiXpJbSW8Vt7pIQagRt06CpNiXtn2jHc4ClUjetwu0nq4IDLub3_iiJLtLH_HykU"
      },
      %{
        name: "Consorsbank SecurePlus",
        package: "com.kobil.consors",
        icon_url:
          "https://play-lh.googleusercontent.com/bfeMA3eJxFzUsmLJ5CxGb9gxZKK-AfBhoeSdCGoOaM8meczH6fKC72XlrN3vhl5FOuEH"
      },
      %{
        name: "Coronapas",
        package: "dk.sum.ssicpas",
        icon_url:
          "https://play-lh.googleusercontent.com/JEaUKGmBRI5n9VxdTR5VoJ_PKLd-XRlfvJmJ3p99LAKPB7UXMXqTbfU_s5qMU2i2GPHD"
      },
      %{
        name: "Coursera",
        package: "org.coursera.android",
        icon_url:
          "https://play-lh.googleusercontent.com/qq5__wITsoCx2kUK8TqVW2-8UDRuxET9kCzPzAPHad8umXiHRF2N0tZKuLezd0tiBQg"
      },
      %{
        name: "Coursicle",
        package: "com.coursicle.coursicle",
        icon_url:
          "https://play-lh.googleusercontent.com/rPSL-wR8zCfHhK36xd1UcSODxEG297jNGTi6NEbYiNzRxLEaSK_R6pXfJkD-A_2i3LF9"
      },
      %{
        name: "Creative Cloud Express: Design",
        package: "com.adobe.spark.post",
        icon_url:
          "https://play-lh.googleusercontent.com/Su39nteYoXMdmmWupitzo9XKZhZnstj2ObmJOR6S-wWCgSnF6USw3Weo7bcDL4RRv79G"
      },
      %{
        name: "Cronometer",
        package: "com.cronometer.android.gold",
        icon_url:
          "https://play-lh.googleusercontent.com/JfuwnIUzDUcY_OqnGCcu3rW5q9l0RlDEabhisQdW88vrBib9e9GQp9S3BjDxilVqiKs"
      },
      %{
        name: "Crossy Road",
        package: "com.yodo1.crossyroad",
        icon_url:
          "https://play-lh.googleusercontent.com/2yH_JCxn7D9FttXZViPhmvIEDfRhio5qdLdWJLxcIfh8PjIkVeBgt_Gj7q21dIRp97g"
      },
      %{
        name: "Crunchyroll",
        package: "com.crunchyroll.crunchyroid",
        icon_url:
          "https://play-lh.googleusercontent.com/CjzbMcLbmTswzCGauGQExkFsSHvwjKEeWLbVVJx0B-J9G6OQ-UCl2eOuGBfaIozFqow"
      },
      %{
        name: "Crypto.com",
        package: "co.mona.android",
        icon_url:
          "https://play-lh.googleusercontent.com/LPjOvRg00ZLcmUvYbvELUX9qN46wUSRrDadTyAxkJIhP8GzUMIA1VZSWxB77BJ0yl1vl"
      },
      %{
        name: "Cryptomator",
        package: "org.cryptomator",
        icon_url:
          "https://play-lh.googleusercontent.com/CnfnpAqOeftFB_uGpR3vw2pIcTTRL19D33OUI8uVomd03v-OcpShDwlJTeGLhAmFtc8"
      },
      %{
        name: "Credit Mutuel",
        package: "com.cm_prod.bad",
        icon_url:
          "https://play-lh.googleusercontent.com/8ezbxdFCz0ZlRNGNOMDqlqlMLyht4YRB7e1rz7GQzuWaobtEkhnBYrYcbvvBQQxvmU0"
      },
      %{
        name: "Cup Piemonte",
        package: "it.aslcittaditorino.cup",
        icon_url:
          "https://play-lh.googleusercontent.com/nkdM8FsKNMqLxlNyvP4AEM3zdkg0z9Vx1uZaUntAFmf7CkyH_52CJT1BRFqHs44JjcLJ"
      },
      %{
        name: "D-Flight",
        package: "it.dflight.app",
        icon_url:
          "https://play-lh.googleusercontent.com/Xu-box5AfrO-RzPsGlFNYupO5T_oS5wjeNfzrlQ69WBUumh5yII7KuR0EnWGSEbwQQPJ"
      },
      %{
        name: "DAVx^5",
        package: "at.bitfire.davdroid",
        icon_url:
          "https://f-droid.org/repo/at.bitfire.davdroid/en-US/icon_NexNou7vmaD45rbdc8kjLj0Rv7FW128Mde9OQpHFXPE=.png"
      },
      %{
        name: "DB Navigator",
        package: "de.hafas.android.db",
        icon_url:
          "https://play-lh.googleusercontent.com/6ErQQ0bzaLghv2F2dm5smkPjYQ_t9uep0yi3OSYY16O9QdyQfV1Uj2TW5MT-wRHJbg"
      },
      %{
        name: "DIC-o Czech-English offline dict.",
        package: "com.dic_o.dico_cze_eng",
        icon_url:
          "https://play-lh.googleusercontent.com/0ztbowotqWGTnFGq9yRgnhtmYWpLw9esflYUJ_5y-18sOS_SUT9dJ8D_wU5dWq5Of_bR"
      },
      %{
        name: "DIC-o Czech-German offline dict.",
        package: "com.dic_o.dico_cze_ger",
        icon_url:
          "https://play-lh.googleusercontent.com/EW8Z5HRXJqEnB3zWXA4bWhFan8lw2ynmsoPhHzJcuurwjZj-hoNWZMjZCBcoFdPYEP0"
      },
      %{
        name: "DKB-Banking",
        package: "de.dkb.portalapp",
        icon_url:
          "https://play-lh.googleusercontent.com/KCyvJK1m9ICndS4pI1U8CeSuQYT5nStpd0MfZVyXW6qQSbNUwf8c21kmeN6QmSiXAErw"
      },
      %{
        name: "DKB-Tan2go",
        package: "com.starfinanz.mobile.android.dkbpushtan",
        icon_url:
          "https://play-lh.googleusercontent.com/YOIZg_GHrMmrSMwzqDfW-D1qZxrweTjWKReWMYWzgGk6l81udoU6Si4YunbCxgm4D8cf"
      },
      %{
        name: "DS Note",
        package: "com.synology.dsnote",
        icon_url:
          "https://play-lh.googleusercontent.com/bf-ohZkpY8UpNm_bbShhTafRVDE9gluf1UVKEcObxWFopkJFfPlRzJzcunoeMK-ZHzc"
      },
      %{
        name: "DS Video",
        package: "com.synology.dsvideo",
        icon_url:
          "https://play-lh.googleusercontent.com/tNTjrILw54nXLL2o0Fj2CHdNtoLNPULFRh3gW9XNyxKBzd5uMzuhspL9w6WV31DojKo"
      },
      %{
        name: "DUAL!",
        package: "com.Seabaa.Dual",
        icon_url:
          "https://play-lh.googleusercontent.com/7HZFiTChYXZubZcDSR-NJwOcPVMjJYp9ydUWLC_c3Ay-j6SQ9UDKca-k87F0_Y9MHQIT"
      },
      %{
        name: "Daylio Journal",
        package: "net.daylio",
        icon_url:
          "https://play-lh.googleusercontent.com/wweiF4j7oCrolJVXpqaBf7egP7ia8j0nt4b97ebS7BcRRQLLIp6fA3HDX0qT1qd4UQ"
      },
      %{
        name: "Daymap Mobile",
        package: "net.daymap.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/Lx0K8oT58sY4_YXB-wgaF38J9TbonqeHM65o1ZoeYrU6PSAILj04bY8DmZmqkg_lMR8"
      },
      %{
        name: "De Lijn",
        package: "com.themobilecompany.delijn",
        icon_url:
          "https://play-lh.googleusercontent.com/frza45Ue18Y9Yu7hy0Uo_QTQgYMZI-VgsI_e0oAerO1CAR7Ue-zJpGqjs08PQksWGw"
      },
      %{
        name: "Deep Fryer",
        package: "teovogel.deepfryer",
        icon_url:
          "https://play-lh.googleusercontent.com/cFCPg91uTbCip6YjbpLegUaxtBcNwBC-WyJoyzzAvMqhBdnVIOmMwbSywqGy6pM2Ow"
      },
      %{
        name: "Deezer",
        package: "deezer.android.app",
        icon_url:
          "https://play-lh.googleusercontent.com/r55K1eQcji3QMHRKERq6zE1-csoh_MTOHiKyHTuTOblhFi_rIz06_8GN5-DHUGJOpn79"
      },
      %{
        name: "Deliveroo",
        package: "com.deliveroo.orderapp",
        icon_url:
          "https://play-lh.googleusercontent.com/vIL5SVs5s307EmCUZ6rWx11YvcoRnk0sMfGB1VCMBD3m78PMGGsZG_3VIwOZoI4TSQ"
      },
      %{
        name: "Delivery Club",
        package: "com.deliveryclub",
        icon_url:
          "https://play-lh.googleusercontent.com/m6-gFunvj7aQD5fdv8EdJZBN5M4REIobTaPZPYS0K5Td7CNYnazN7fOKiPwwaY3hJw"
      },
      %{
        name: "DigiD",
        package: "nl.rijksoverheid.digid.pub",
        icon_url:
          "https://play-lh.googleusercontent.com/C9e4F4VyGITEz4nGOijmIOKbRCVQiEHdV4cJhsTApD1i8iJUd5ZabsTzx1VGtKrz7Pw"
      },
      %{
        name: "Digiposte",
        package: "com.laposte.bnum.digiposteplus",
        icon_url:
          "https://play-lh.googleusercontent.com/_AwTpxsjj4zJLym8GqyWTeRQqCypc_JhF-M8E8Ba365arIjOCtXSwmMfR39FJ1uNdtk"
      },
      %{
        name: "Discord",
        package: "com.discord",
        icon_url:
          "https://play-lh.googleusercontent.com/0oO5sAneb9lJP6l8c6DH4aj6f85qNpplQVHmPmbbBxAukDnlO7DarDW0b-kEIHa8SQ"
      },
      %{
        name: "Disney+",
        package: "com.disney.disneyplus",
        icon_url:
          "https://play-lh.googleusercontent.com/xoGGYH2LgLibLDBoxMg-ZE16b-RNfITw_OgXBWRAPin2FZY4FGB9QKBYApR-0rSCkQ"
      },
      %{
        name: "Dlf Audiothek",
        package: "de.deutschlandfunk.dlfaudiothek",
        icon_url:
          "https://play-lh.googleusercontent.com/aFNlXOvTj_vKd1PHuI0ZxvTlZ8ppMCXU3bANy7Co8BvJnAqsZb3fMopa7_MeF6aMGg"
      },
      %{
        name: "Dlf: Die Nachrichten",
        package: "de.deutschlandradio.dlf24",
        icon_url:
          "https://play-lh.googleusercontent.com/Xo3h9uBZkmWRLsicmjbyDl_c4jPXYidtMSxcBTwe4_DkloCbWKi016oJiMv-Lfzhz9_M"
      },
      %{
        name: "Doccle",
        package: "be.ixor.doccle.android",
        icon_url:
          "https://play-lh.googleusercontent.com/6mZS7ve7rl6omST81ujKMZFswBqk8oSobFphqyRUauv7tTvflHv8MuNUvreJtUDw8w4"
      },
      %{
        name: "Doctolib",
        package: "fr.doctolib.www",
        icon_url:
          "https://play-lh.googleusercontent.com/2ACsMp3soITRoUc7n6_xXqwAhYRSHqbHexJOz6x_1LznBX0FgBVxYVXePN_puZSi6TbS"
      },
      %{
        name: "Dolomiten",
        package: "com.dolomiten",
        icon_url:
          "https://play-lh.googleusercontent.com/Q02pHEf62ID-SED8ZRfcf0kVTZ8nMMMeyTRD-jvf7JjnT67CE4pcvwuzpdC1bY_IzYY"
      },
      %{
        name: "Doodle Jump",
        package: "com.lima.doodlejump",
        icon_url:
          "https://play-lh.googleusercontent.com/aHnvdFTx0LVyfVHQLX51VcWBYkSVGvggr4FvIiP-iwBu4pKBiOQA1OnRi_nyFdCWqlU8"
      },
      %{
        name: "DoorDash",
        package: "com.doordash.driverapp",
        icon_url:
          "https://play-lh.googleusercontent.com/trfOy_Wg9gQTwGcoYJNushqXIV3xFhWBReAVWM5IPqspN5N811YhTKQCG48anNS13HE"
      },
      %{
        name: "DreamLab",
        package: "au.com.vodafone.dreamlabapp",
        icon_url:
          "https://play-lh.googleusercontent.com/8YzMr-kClnDrCYQbvgNxC0JHZFWJi5tVEfnmWYLEeDRbb8tmGZYekqo3X_ERVZjQqV9y"
      },
      %{
        name: "Droidcam",
        package: "com.dev47apps.droidcam",
        icon_url:
          "https://play-lh.googleusercontent.com/bx3ZHgh7WiuUd7-tnM8ay5FlDuq_hamRFquBO8nN6Hl0lDbHpym7DhsEH1ME8SU01HKK"
      },
      %{
        name: "DropSync",
        package: "com.ttxapps.dropsync",
        icon_url:
          "https://play-lh.googleusercontent.com/BUdRHW_WwuOk8X-XfAK7Tj7KnS9LZex_559rImRK75pcJTjmf1A60MhPk0DkV_duIg"
      },
      %{
        name: "Dropbox",
        package: "com.dropbox.android",
        icon_url:
          "https://play-lh.googleusercontent.com/b1-MIBjlMD9kvl0Okeglm9BL9ejRpOXMio303W0tiLb8Ul5WuVzBDoDKgGRcALOsCdw"
      },
      %{
        name: "DuckDuckGo Privacy Browser",
        package: "com.duckduckgo.mobile.android",
        icon_url:
          "https://play-lh.googleusercontent.com/NW2ASwJ4qtxfThhVIpm4641sR4o-yGv80yqaJnOnpC4lEmdxEcNTFcF6-TlZYtmdaA"
      },
      %{
        name: "Duo Mobile",
        package: "com.duosecurity.duomobile",
        icon_url:
          "https://play-lh.googleusercontent.com/dpE6aQQqc2Obn9ddW741YegLaoTNNPfzmLhC2qnMPoZPM50DOkJyRhiQ2gw8dSLoNQ"
      },
      %{
        name: "Duolingo",
        package: "com.duolingo",
        icon_url:
          "https://play-lh.googleusercontent.com/hSyebBlYwtE2aMjzSIHasUO9cQv9HgNAw9owy6ADO0szOKYO3rDk60r7jcyXu82Fbq1M"
      },
      %{
        name: "EXPRESS",
        package: "com.gpshopper.express.android",
        icon_url:
          "https://play-lh.googleusercontent.com/tYFJKlcOj4mUoS36v7w50TRvZ4HErZVkjo2Nvc4Ba_XE5xBr0Rphj4_BW-wMJ-JsDfEC"
      },
      %{
        name: "EasyBudget",
        package: "com.benoitletondor.easybudgetapp",
        icon_url:
          "https://play-lh.googleusercontent.com/tzaD7rQtrJ-p_maMqKxdWfqPN3B4pjyk2H8pniqTA8zm6OjiPE_I85jtFLMRKtBEGOs"
      },
      %{
        name: "EasyJet",
        package: "com.mttnow.droid.easyjet",
        icon_url:
          "https://play-lh.googleusercontent.com/Thn1XxCmoZ9VdmKBfAP5Hvi8EZ8D6_ffGSDaiJTohJulisRXGsfkO_7OH-_ivbSCbrA"
      },
      %{
        name: "EasyPark",
        package: "net.easypark.android",
        icon_url:
          "https://play-lh.googleusercontent.com/DQE09F_LOjQYuyqYTEV_aMKOtFevOUABxzSGr-ngxN78_ALyY6uNbr73CssttDhrdRQ"
      },
      %{
        name: "Electron Cash wallet for Bitcoin Cash",
        package: "org.electroncash.wallet",
        icon_url:
          "https://play-lh.googleusercontent.com/oQqQWxDeiexUXVT5nhwOyW-gNIKIBgf_QkFLroXek5ybDVcyJRnPhE075Oa5f3tnVxnn"
      },
      %{
        name: "Element",
        package: "im.vector.app",
        icon_url:
          "https://f-droid.org/repo/im.vector.app/en-US/icon_3Lck8RKnv8uMRsiOs3GqWqo65YjijRzVA8EchS_gDoo=.png"
      },
      %{
        name: "Emby",
        package: "com.mb.android",
        icon_url:
          "https://play-lh.googleusercontent.com/x2eHcquFzIsSuhwXmbvD_xouXUxMkAfdak0z8zayXU_OzC9yYxBdbur3nE_kE4kazg"
      },
      %{
        name: "Enpass",
        package: "io.enpass.app",
        icon_url:
          "https://play-lh.googleusercontent.com/1qKnx7fZcyjQjoZpKaUHQ8lhNvzaKO_ECubBYI0K0zKG3qYqWyDJFOogqB4CJRkcPeZ_"
      },
      %{
        name: "Epoch Times App",
        package: "com.theepochtimes.news",
        icon_url:
          "https://play-lh.googleusercontent.com/vwo5HhCG8RvwBVIUifyPOM_MisjhcqbbKEJ4Gxxbx-vnU9atgAVl73kem19RVLJnG9A"
      },
      %{
        name: "Etsy",
        package: "com.etsy.android",
        icon_url:
          "https://play-lh.googleusercontent.com/giKCCPigafUbKQ1AkXVxSjQ1PggetEI96ORNKxxhQdvGAFhto71kO4zf7gZ9oOdLIQe5"
      },
      %{
        name: "EufySecurity",
        package: "com.oceanwing.battery.cam",
        icon_url:
          "https://play-lh.googleusercontent.com/N_jmllMRDnI0ZRxMGiCSYkeE6rV4WvxA0YY5J5DwyikjgIVlPpgZ-0s1RVTCqgAKtnE"
      },
      %{
        name: "Eurail/Interrail Rail Planner",
        package: "org.eurail.railplanner",
        icon_url:
          "https://play-lh.googleusercontent.com/e8jXLtribWPRx2ot6K-O8hRtfMxulOOJu7E-vZ7SW0vY7i_UVChWrsifRFF10vV4Gw"
      },
      %{
        name: "Evernote",
        package: "com.evernote",
        icon_url:
          "https://play-lh.googleusercontent.com/QJObxznpklAxDNp0OVe3kAP5ZfUouIvRDO0kPj-V3MRjoRYKwj9RVTxOwG9yrlY-bgG3"
      },
      %{
        name: "Exodus: Crypto Bitcoin Wallet",
        package: "exodusmovement.exodus",
        icon_url:
          "https://play-lh.googleusercontent.com/d0y_tc6f3BRdVodzpcqoXYQSndvlMoXXqHAwHmDvzwghRvQO8WGSM1I8_lHK_OUNVQ"
      },
      %{
        name: "Expo",
        package: "host.exp.exponent",
        icon_url:
          "https://play-lh.googleusercontent.com/algsmuhitlyCU_Yy3IU7-7KYIhCBwx5UJG4Bln-hygBjjlUVCiGo1y8W5JNqYm9WW3s"
      },
      %{
        name: "Express Plus Medicare",
        package: "au.gov.dhs.expressplus.medicare",
        icon_url:
          "https://play-lh.googleusercontent.com/5d8iujJuJs7Q625FkfKiF-tR2cE2KNeCGsc0QmfbSL7QELUJJR0f7MaQNZl2Zxg-m_bI"
      },
      %{
        name: "ExpressVPN",
        package: "com.expressvpn.vpn",
        icon_url:
          "https://play-lh.googleusercontent.com/9cUA5prRw5giaHElxiilJ3Ek2AB1O52BZbJrQAV1TTF3GJVxyP91_vZZMz0csO7HOfg"
      },
      %{
        name: "FOCUS Online Nachrichten",
        package: "de.cellular.focus",
        icon_url:
          "https://play-lh.googleusercontent.com/wlNVwnuN70qYc71nU3yvTAAYUTJU7chIaHg7YMG_w9PjGVfnuaERy4SQL-i__SmMtQ"
      },
      %{
        name: "FR Legends",
        package: "com.fengiiley.frlegends",
        icon_url:
          "https://play-lh.googleusercontent.com/YqwwYKH8G1i2bRb3x1_BV6qNEDSzWpwWBiIQvae7IZUYrVmUmMcPvPDIRRKa4xg_-GQ"
      },
      %{
        name: "FX File Explorer",
        package: "nextapp.fx",
        icon_url:
          "https://play-lh.googleusercontent.com/DhBFSJoink5IMx0GdrmYuF-HzAqfSt_0wTkW0UtnAmp76tAEF98C3K5a-hP_KzgB0xY"
      },
      %{
        name: "Facebook",
        package: "com.facebook.katana",
        icon_url:
          "https://play-lh.googleusercontent.com/ccWDU4A7fX1R24v-vvT480ySh26AYp97g1VrIB_FIdjRcuQB2JP2WdY7h_wVVAeSpg"
      },
      %{
        name: "Facebook Lite",
        package: "com.facebook.lite",
        icon_url:
          "https://play-lh.googleusercontent.com/5pZMqQYClc5McEjaISPkvhF8pDmlbLqraTMwk1eeqTlnUSjVxPCq-MItIrJPJGe7xW4"
      },
      %{
        name: "Facebook Messenger",
        package: "com.facebook.orca",
        icon_url:
          "https://play-lh.googleusercontent.com/ldcQMpP7OaVmglCF6kGas9cY_K0PsJzSSosx2saw9KF1m3RHaEXpH_9mwBWaYnkmctk"
      },
      %{
        name: "Fashion Nova",
        package: "co.tapcart.app.npQt0DXZpj",
        icon_url:
          "https://play-lh.googleusercontent.com/8BPiZHEN9bYRmL89Pe0_Iy2VZ4e0cAdEHMJ242bsNkN1PDPwyFxhWQqmWWs7bmlSx0kH"
      },
      %{
        name: "Fast Scanner",
        package: "com.coolmobilesolution.fastscannerfree",
        icon_url:
          "https://play-lh.googleusercontent.com/zwy4Zmr7NfqwJIeOtdvivtedDGlfZxObv5LBZThfJt8U1y0ClbnXuQW36jjtvtKaJg"
      },
      %{
        name: "Final Surge",
        package: "com.finalsurge.runtracker",
        icon_url:
          "https://play-lh.googleusercontent.com/V9mJ99EkJ5V9hjlOO0GLVxEG_Gf0Tr_vr6TQtYMQ36oyk3gKEbnYYF5TZKuL5KXIlPS9"
      },
      %{
        name: "Fire Emblem Heroes",
        package: "com.nintendo.zaba",
        icon_url:
          "https://play-lh.googleusercontent.com/KHOyB5bu2nLWDDmXTqETQuEY3FBf2WgylRTsE6nf8zi8_9CSC2s-FbZpkuMBp45ymg"
      },
      %{
        name: "Firefox",
        package: "org.mozilla.firefox",
        icon_url:
          "https://play-lh.googleusercontent.com/zqsuwFUBwKRcGOSBinKQCL3JgfvOW49vJphq0ZF32aDgfqmuDyl-fEpx4Lxm4pRr7A"
      },
      %{
        name: "Firefox Focus",
        package: "org.mozilla.focus",
        icon_url:
          "https://play-lh.googleusercontent.com/yssuOUUgzoiZve-NfSvkykhAP9QbnFEL-NfLNHmTjnAcLCMnEpZsvwg1brdSuRZrqg"
      },
      %{
        name: "FitNotes",
        package: "com.github.jamesgay.fitnotes",
        icon_url:
          "https://play-lh.googleusercontent.com/mvY8S6uxR1AmEEt9nqPfqvnefM5JWe74YbblFkjPt7LDGHC62UD988-soAvu83qG6hA"
      },
      %{
        name: "Fitbit",
        package: "com.fitbit.FitbitMobile",
        icon_url:
          "https://play-lh.googleusercontent.com/QhMCymTyxJbzRiwMBA-GYooS-nVKm3fHg2CSRyKHvhmC-e5vOibfST73y1MmScvtPw"
      },
      %{
        name: "FlashAir",
        package: "jp.co.toshiba.android.FlashAir",
        icon_url:
          "https://play-lh.googleusercontent.com/48p3F3hf6dXTPDJHbjM1SmuTiDUgh_-C2RsqxyrIJQF_MsYxXQUsejF7ACRij5q8qMo"
      },
      %{
        name: "Flexom 2.0",
        package: "com.ubiant.flexom",
        icon_url:
          "https://play-lh.googleusercontent.com/wcTOZEltPSgkqX1671eaQGReNYtdXwFxi9zEHIghQC5NQ38SGz3USgZEACHtXcB9QxE"
      },
      %{
        name: "Flipboard",
        package: "flipboard.app",
        icon_url:
          "https://play-lh.googleusercontent.com/Z5WroTW4KmTB3mvUhZMLwgFD2VymNypnEVVxoueXPPCKEFrnUAiZVl0684t1RFEOPqzB"
      },
      %{
        name: "FlixBus",
        package: "de.flixbus.app",
        icon_url:
          "https://play-lh.googleusercontent.com/QqJ4jHU5FHRvqp5lWJVQPShGKI9wqZy4ph0SYousFr7Guvk3mOZPvYxbgbMuSdD1dQI"
      },
      %{
        name: "Flow Free",
        package: "com.bigduckgames.flow",
        icon_url:
          "https://play-lh.googleusercontent.com/cKgJRbFkjVAm6XkkSILGleGkT317BLLD8erTsrI1vo240a991MGJzbMryBKFG7Zw7tU"
      },
      %{
        name: "Foot Locker MENA",
        package: "com.footlocker.mena",
        icon_url:
          "https://play-lh.googleusercontent.com/Q06DQ-l0qqu6CPe0IQfVZ9jTu6YX39_JDKGvnM2CQSfLTHG1jEDKB4rTGwtif0DVUNo"
      },
      %{
        name: "Fox News",
        package: "com.foxnews.android",
        icon_url:
          "https://play-lh.googleusercontent.com/TA1fIRwGKyTlAc3tpu_nPKZnwr5u1PN3W1glmtJzm1dCR-pzjXiqCEhC2QkLgGx9LW8"
      },
      %{
        name: "Freja eID",
        package: "com.verisec.mobile.frejaeid",
        icon_url:
          "https://play-lh.googleusercontent.com/7atB5YZ1m0KVBTxr9e1SqbgKQYcc3xLlvaT7ROuQTsyekFf-cPb7UOORb-rYmaHyyg"
      },
      %{
        name: "GETTR",
        package: "com.gettr.gettr",
        icon_url:
          "https://play-lh.googleusercontent.com/FlTED74WSsHGXz7dLz4gwkfUHjlY023TqQoA6nwATMwOOHEQLjio9PVfL896t7_G3MM"
      },
      %{
        name: "GLS mBank",
        package: "de.gls.mbank",
        icon_url:
          "https://play-lh.googleusercontent.com/cyqt54N2pCnf1RbrSbXEF87lS7CXKQVLpsKQHI5s5RCqWbber2mB7OP2KNCcY7N9u7w"
      },
      %{
        name: "GUCCI",
        package: "com.gucci.gucciapp",
        icon_url:
          "https://play-lh.googleusercontent.com/KsNNUtauW11w6FJaECfIIQUXZx1kU3q94o_cAOEhT_86P9gbiG_F654cF9b8oVLv0tY"
      },
      %{
        name: "Garmin Connect",
        package: "com.garmin.android.apps.connectmobile",
        icon_url:
          "https://play-lh.googleusercontent.com/iij3jFOUWtGGTVwOqved-9DLpBsRbvgfyPpFuebloLUuIz-JO42h2UVyQ-c8IrRg9kb9"
      },
      %{
        name: "Genius  Song Lyrics Finder",
        package: "com.genius.android",
        icon_url:
          "https://play-lh.googleusercontent.com/e6-dZlTM-gJ2sFxFFs3X15O84HEv6jc9PQGgHtVTn7FP6lUXeEAkDl9v4RfVOwbSuQ"
      },
      %{
        name: "GeoGebra Graphing Calculator",
        package: "org.geogebra.android",
        icon_url:
          "https://play-lh.googleusercontent.com/z8nDolnGI78U0MNpuj9qcQpUCAzVULA4pEu_MChIAEhLLW_GA3HMVBj6o2cxlBQVmcI"
      },
      %{
        name: "Geometry Dash",
        package: "com.robtopx.geometryjump",
        icon_url:
          "https://play-lh.googleusercontent.com/ixHXzBWPmmKWIBxDMfjbIXK10UQCTDvIYOcs_uLXHCRbdsz2siJFYfb7MqckU8eC3Ks"
      },
      %{
        name: "Gett",
        package: "com.gettaxi.android",
        icon_url:
          "https://play-lh.googleusercontent.com/8hD4C3RrohLQUNrQRaZd4Bm2Sl7fpE6mlhlapCCmXiLBLOKNRU-ZO1tp3cGppXcJEJc"
      },
      %{
        name: "Giga Monitor",
        package: "br.inatel.icc.gigasecurity.gigamonitor",
        icon_url:
          "https://play-lh.googleusercontent.com/dTTSfaUJQXUemrjVFu9ySRnX5LoIISCcNdDtW5qw4G_mNpNm3dC6j4KTBu_6lKtQlQ"
      },
      %{
        name: "Gilt",
        package: "com.gilt.android",
        icon_url:
          "https://play-lh.googleusercontent.com/qg_8C2qmAZNhr9vX6rNpCfPQAJJXSGQFb1Bc6QUFb2IG2Ei6rQDw1eAKJssLPN-62dY"
      },
      %{
        name: "Ginventory",
        package: "be.reed.ginventory",
        icon_url:
          "https://play-lh.googleusercontent.com/1aJ0YAuEUo0YqoZkiA34fvxU2l1-fm8OampaNJEMfmVJSDZuqUJKEBsWwcNb14CtS-64"
      },
      %{
        name: "Github",
        package: "com.github.android",
        icon_url:
          "https://play-lh.googleusercontent.com/PCpXdqvUWfCW1mXhH1Y_98yBpgsWxuTSTofy3NGMo9yBTATDyzVkqU580bfSln50bFU"
      },
      %{
        name: "Gmail",
        package: "com.google.android.gm",
        icon_url:
          "https://play-lh.googleusercontent.com/KSuaRLiI_FlDP8cM4MzJ23ml3og5Hxb9AapaGTMZ2GgR103mvJ3AAnoOFz1yheeQBBI"
      },
      %{
        name: "GoSign by InfoCert SpA",
        package: "it.infocert.mobile.dike",
        icon_url:
          "https://play-lh.googleusercontent.com/AORuBhhSEu-mci-LGF4VhcK6x9dw_knteG5HexT2IL_xmtQzdXICwqDkrob1bpE7BQ"
      },
      %{
        name: "GoSign by InfoCert SpA",
        package: "it.infocert.mobile.dike",
        icon_url:
          "https://play-lh.googleusercontent.com/AORuBhhSEu-mci-LGF4VhcK6x9dw_knteG5HexT2IL_xmtQzdXICwqDkrob1bpE7BQ"
      },
      %{
        name: "GoldenDict",
        package: "mobi.goldendict.android",
        icon_url:
          "https://play-lh.googleusercontent.com/bXHUlNEj3gS-XwvgKpYRXpcyCWykh8cvDI8oEA3rckGgJ18xFS-7K8u8U_2_XqP7BTc"
      },
      %{
        name: "Golds Gym Virtual",
        package: "com.trainerize.goldsgymormondbeach",
        icon_url:
          "https://play-lh.googleusercontent.com/ljmDb4QNz5mJ6yBsHkIJwHQ2b2nVD-7Z4Uav5SSYldvqb0DwpMQ-ZtzU9ZS3qWO5KN0"
      },
      %{
        name: "Goodreads",
        package: "com.goodreads",
        icon_url:
          "https://play-lh.googleusercontent.com/p0TzV6-CHE24ySIsC05vjGIS_PWaXIzE6Edzrw0VX7betQUtYY3FSFIKVjjMWJFXuj-u"
      },
      %{
        name: "Google",
        package: "com.google.android.googlequicksearchbox",
        icon_url:
          "https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1"
      },
      %{
        name: "Google Authenticator",
        package: "com.google.android.apps.authenticator2",
        icon_url:
          "https://play-lh.googleusercontent.com/oMv9o-L-mNKdyL3Hp6fvNwrhAyIYB1iP3p644hxN03oFU0R2oevnmxmCLF6FewjzZXU"
      },
      %{
        name: "Google Calendar",
        package: "com.google.android.calendar",
        icon_url:
          "https://play-lh.googleusercontent.com/Jsbb0EeesKUbDTl3UyDKO6sNz45RCMh7gnoI6giQcQz1f5Mj0J4TRh7Psyu53vShh-qm"
      },
      %{
        name: "Google Camera",
        package: "com.google.android.GoogleCamera",
        icon_url:
          "https://play-lh.googleusercontent.com/UEhZQtc_3LCwkKIayRjHG63EfC9bsXvJjuWiFMvVRAe_tHyk0pW4ZmCBJQCENxmYlYk"
      },
      %{
        name: "Google Cardboard",
        package: "com.google.samples.apps.cardboarddemo",
        icon_url:
          "https://play-lh.googleusercontent.com/OF-_SP5tzFPxK7NBoX7Y-Wsz32Woy_JliL4kZSTdkNz-PyAiHV1znVwjkQgn5vGahA"
      },
      %{
        name: "Google Chat",
        package: "com.google.android.apps.dynamite",
        icon_url:
          "https://play-lh.googleusercontent.com/cF_oWC9Io_I9smEBhjhUHkOO6vX5wMbZJgFpGny4MkMMtz25iIJEh2wASdbbEN7jseAx"
      },
      %{
        name: "Google Classroom",
        package: "com.google.android.apps.classroom",
        icon_url:
          "https://play-lh.googleusercontent.com/w0s3au7cWptVf648ChCUP7sW6uzdwGFTSTenE178Tz87K_w1P1sFwI6h1CLZUlC2Ug"
      },
      %{
        name: "Google Contacts",
        package: "com.google.android.contacts",
        icon_url:
          "https://play-lh.googleusercontent.com/fvhPW8dpGXM42Y-6aQU8Yl25L1l_mVgeoM-n08FxAkM7umAHkNs8wcs4MA49E67a7WVt"
      },
      %{
        name: "Google Drive",
        package: "com.google.android.apps.docs",
        icon_url:
          "https://play-lh.googleusercontent.com/t-juVwXA8lDAk8uQ2L6d6K83jpgQoqmK1icB_l9yvhIAQ2QT_1XbRwg5IpY08906qEw"
      },
      %{
        name: "Google Earth",
        package: "com.google.earth",
        icon_url:
          "https://play-lh.googleusercontent.com/9ORDOmn8l9dh-j4Sg3_S7CLcy0RRAI_wWt5jZtJOPztwnEkQ4y7mmGgoSYqbFR5jTc3m"
      },
      %{
        name: "Google Fi",
        package: "com.google.android.apps.tycho",
        icon_url:
          "https://play-lh.googleusercontent.com/QA0eHnkG-0h4u3oZ0AKqt_nvuJ7ruDo25FdiBziKdtGu_fEMy0eRGV7sVPKAINck8i4"
      },
      %{
        name: "Google Gallery Go",
        package: "com.google.android.apps.photosgo",
        icon_url:
          "https://play-lh.googleusercontent.com/pmEnTOeRvosC1yOXFVwo15zS2uAdB9nijugU93NbrmFBYt61IVCZBzg7EZ00YTqmLw"
      },
      %{
        name: "Google Home",
        package: "com.google.android.apps.chromecast.app",
        icon_url:
          "https://play-lh.googleusercontent.com/vr1isZKzTtlok9P81H6cR98iqpPhkuQHJp19Z5kPej3QlhNTnLohXpqcgMqrQpyegA"
      },
      %{
        name: "Google Keep Notes",
        package: "com.google.android.keep",
        icon_url:
          "https://play-lh.googleusercontent.com/9bJoeaPbGTB8Tz_h4N-p-6ReRd8vSS-frZb2tmJulaGIoTKElKj3zpmcFJvnS96ANZP5"
      },
      %{
        name: "Google Keyboard (Gboard)",
        package: "com.google.android.inputmethod.latin",
        icon_url:
          "https://play-lh.googleusercontent.com/X64En0aW6jkvDnd5kr16u-YuUsoJ1W2cBzJab3CQ5lObLeQ3T61DpB7AwIoZ7uqgCn4"
      },
      %{
        name: "Google Lens",
        package: "com.google.ar.lens",
        icon_url:
          "https://play-lh.googleusercontent.com/G5oF0mhpOcQzFTrU6TDUL0JoAjzRt38weiZKua7L61WVT1z3dPcE9gUu-W2EwtM9cZU"
      },
      %{
        name: "Google Maps",
        package: "com.google.android.apps.maps",
        icon_url:
          "https://play-lh.googleusercontent.com/Kf8WTct65hFJxBUDm5E-EpYsiDoLQiGGbnuyP6HBNax43YShXti9THPon1YKB6zPYpA"
      },
      %{
        name: "Google Meet",
        package: "com.google.android.apps.meetings",
        icon_url:
          "https://play-lh.googleusercontent.com/DjOehhj7NQVdm1dmBAGdmxgoNR76IxZPG5lHoDx0EAKv8NGgvgxm4GuzQ-iTOk1nMQ"
      },
      %{
        name: "Google Messages",
        package: "com.google.android.apps.messaging",
        icon_url:
          "https://play-lh.googleusercontent.com/9AZOTXU_CpreTFAXUPAmJNkm8VGCb1C90fjJ9pHGcVmpGMDSTq3cUbaQJdBT9Tdp9A"
      },
      %{
        name: "Google News",
        package: "com.google.android.apps.magazines",
        icon_url:
          "https://play-lh.googleusercontent.com/b3MqZswO8F7j3lcdH01kxzaeHa7vUndy7ma_JwdM_j_Vpj8LKZcKt0HmpORQ7CKF2A"
      },
      %{
        name: "Google Pay",
        package: "com.google.android.apps.nbu.paisa.user",
        icon_url:
          "https://play-lh.googleusercontent.com/HArtbyi53u0jnqhnnxkQnMx9dHOERNcprZyKnInd2nrfM7Wd9ivMNTiz7IJP6-mSpwk"
      },
      %{
        name: "Google Phone",
        package: "com.google.android.dialer",
        icon_url:
          "https://play-lh.googleusercontent.com/bk3e0glVbvRC4Z0uEZ5Oso5wjS89r1P_X5e-k3N_UBkTPXZLhGv50rRy7LAuDzzC9w"
      },
      %{
        name: "Google Photos",
        package: "com.google.android.apps.photos",
        icon_url:
          "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA"
      },
      %{
        name: "Google Play Services for AR",
        package: "com.google.ar.core",
        icon_url:
          "https://play-lh.googleusercontent.com/ugEBVDcghA1x9fVldH8oz3aEQnMLki0pEc5xfpaZTi9SQGEbQqM-Cbzb60MU4fLM9bIv"
      },
      %{
        name: "Google TV (previously Play Movies & TV)",
        package: "com.google.android.videos",
        icon_url:
          "https://play-lh.googleusercontent.com/qaXTXjbeuD0m-JDrJ2Y76_5Ghr_UDGQOJRmuYfLGekbMK0s5VXkGFjNCHS4tUJxumQ"
      },
      %{
        name: "Google Translate",
        package: "com.google.android.apps.translate",
        icon_url:
          "https://play-lh.googleusercontent.com/ZrNeuKthBirZN7rrXPN1JmUbaG8ICy3kZSHt-WgSnREsJzo2txzCzjIoChlevMIQEA"
      },
      %{
        name: "Google Wallpaper",
        package: "com.google.android.apps.wallpaper",
        icon_url:
          "https://play-lh.googleusercontent.com/2aJfB6trLglywvIh6MSN58qh-r2b-_2GoXk4dWL5fIZmMAWdTN3f98Ugpi6U_glIm0w"
      },
      %{
        name: "Gotify",
        package: "com.github.gotify",
        icon_url:
          "https://f-droid.org/repo/com.github.gotify/en-US/icon_dZzYyqYLbiyccNEO4PmwLNlfzOdOP13LOF-yNULEwfY=.png"
      },
      %{
        name: "Greenify",
        package: "com.oasisfeng.greenify",
        icon_url:
          "https://play-lh.googleusercontent.com/w261De9ZkHSxBGYcdFXG9BySiK2ugwMb7ReGh_AfN7UUSefB3ja_wPVtP91aewaKoKO0"
      },
      %{
        name: "Groupme",
        package: "com.groupme.android",
        icon_url:
          "https://play-lh.googleusercontent.com/3v5rY1LyfDpINaf1MIQXOE1cwt37Xnwf1h82UQsqsW8RyF6qaJmgOHxjQ3BGU3MS7A"
      },
      %{
        name: "Guilded",
        package: "com.gg.guilded",
        icon_url:
          "https://play-lh.googleusercontent.com/6So1NGvRZ1xLq5Y7gjth5jLv9yP_bMkeT4BYYaglZ9tM_oIgoDyEx79PenhceXLwBKpc"
      },
      %{
        name: "GuitarTuna",
        package: "com.ovelin.guitartuna",
        icon_url:
          "https://play-lh.googleusercontent.com/fncHoaxMdpJoXVs61jdTSugZDtyPL_gqA2TxcwkKXvr80ixqw-cSgO8Bwq9zltH4CObC"
      },
      %{
        name: "H&M",
        package: "com.hm.goe",
        icon_url:
          "https://play-lh.googleusercontent.com/fZ7YafYdCZ7U4LK4J7YiZXfIxdW2VqBODOv5moszVcVN721KGnQXQo9xPFy0Ws0tZw"
      },
      %{
        name: "HBO Max",
        package: "com.hbo.hbonow",
        icon_url:
          "https://play-lh.googleusercontent.com/1iyX7VdQ7MlM7iotI9XDtTwgiVmqFGzqwz10L67XVoyiTmJVoHX87QtqvcXgUnb0AC8"
      },
      %{
        name: "HEY Email",
        package: "com.basecamp.hey",
        icon_url:
          "https://play-lh.googleusercontent.com/2Ikhuuhxsn0Ckw7mDy9Hbup27DwFyF8MKHqk7PMjTKLL0ccO0LXZrDoKQLSejnjC2QM"
      },
      %{
        name: "Halifax Mobile Banking",
        package: "com.grppl.android.shell.halifax",
        icon_url:
          "https://play-lh.googleusercontent.com/gnwz03bfeirJCBbFXqUP87qEeJd8nc4HGmEVCNsxVVoRsT4BesuVrCZSVk256F_TTQ"
      },
      %{
        name: "Headspace: Mindful Meditation",
        package: "com.getsomeheadspace.android",
        icon_url:
          "https://play-lh.googleusercontent.com/y6ZZo_LKpI8sBXAHb9TMSfgoY96yVU0ecumaOb8hckSdvDzdssiQd2QW1cx1CrjvA4bQ"
      },
      %{
        name: "Hello Weather",
        package: "com.helloweatherapp",
        icon_url:
          "https://play-lh.googleusercontent.com/FPBTuf-13tdmDg1cLjBbJlxeI0VyDQc6ATe25u7yw-sdTweLU_pO_0JR3xRI0aKlSeU"
      },
      %{
        name: "Hermit",
        package: "com.chimbori.hermitcrab",
        icon_url:
          "https://play-lh.googleusercontent.com/4uZSeAzYMSId4t04Gimy_dTN6eCBAZ1slyR1RpQzulo8HzaAAdVffX73KwqyIY9BaX1T"
      },
      %{
        name: "Hill Climb Racing",
        package: "com.fingersoft.hillclimb",
        icon_url:
          "https://play-lh.googleusercontent.com/N0UxhBVUmx8s7y3F7Kqre2AcpXyPDKAp8nHjiPPoOONc_sfugHCYMjBpbUKCMlK_XUs"
      },
      %{
        name: "Homematic IP",
        package: "de.eq3.pscc.android",
        icon_url:
          "https://play-lh.googleusercontent.com/ikUXa9I0yF3fPbuZcaBtG_sGtRemGhTAWlHwBzys23JYaoO_ZAEPvmjTuiC-9XOpSEU"
      },
      %{
        name: "Homescapes",
        package: "com.playrix.homescapes",
        icon_url:
          "https://play-lh.googleusercontent.com/cb7FFnDCsn3mV-LNCAvixT4TLBupTsxdvTLotYZB2B8JzwsHDbxtJ1MZE851Pa6ubMQ"
      },
      %{
        name: "Honey",
        package: "com.joinhoney.honeyandroid",
        icon_url:
          "https://play-lh.googleusercontent.com/E3PejGWhQfc0BPecmtncXfap7rKazvedmHSJad0Xj9wv7Bm_KLtH31GR37tn057NfbY"
      },
      %{
        name: "Hungry Shark Evolution",
        package: "com.fgol.HungrySharkEvolution",
        icon_url:
          "https://play-lh.googleusercontent.com/8A5uiQF67rXc3aa-wYyRawBSpdKHAus2l-Y6Rrgsc5fcq4Bf4Izm4bZCIMMyDmAlSg"
      },
      %{
        name: "Hushed",
        package: "com.hushed.release",
        icon_url:
          "https://play-lh.googleusercontent.com/1Ex9G2oUKaNRpSHHDKAXLPNqXIXe84weDknNzHVRCbmbB8UVQHycvdt8hah7qLHsstUn"
      },
      %{
        name: "Hype",
        package: "it.hype.app",
        icon_url:
          "https://play-lh.googleusercontent.com/lpwbiSGBMbR8BWZJ4Y3DZYc9dua6TWzdzzIg7YwZVXPsjVAR64C-gTIO195_nKE_ck4P"
      },
      %{
        name: "IDS JMK Poseidon",
        package: "cz.devsoft.poseidon",
        icon_url:
          "https://play-lh.googleusercontent.com/EvrwYKY6Fw6vxQCTeVoVNX8lALgGOhyHVb5hVUBZJBXumkOgc2tDKb_jX2u7_WZRfkjS"
      },
      %{
        name: "IMDB app",
        package: "com.imdb.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/sb30umyAPj9A4ixl4jnPJO15ET-mo4TihKOI0xwFzRbxOfZo6fozeKmAjf8Lhl3mqHY"
      },
      %{
        name: "ING Bankieren (NL)",
        package: "com.ing.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/SwZjyAwTQdZ0UiOmaTkORqVijgK-tsb4c-lLowpY3g-9QYY5nwtSgLGAoDlLhbcENSQ"
      },
      %{
        name: "ING Banking",
        package: "com.ing.banking",
        icon_url:
          "https://play-lh.googleusercontent.com/3PTyadZ0AoT4TB3WIht5I55dV4rPYZN64gCN40x30F26nRuuA6YaGWfntGIWHB6sC10"
      },
      %{
        name: "IPVanish",
        package: "com.ixolit.ipvanish",
        icon_url:
          "https://play-lh.googleusercontent.com/ndeRYhIKXmTJuf2GW5j9oEBc5ddYI1hSQU7kmsTtbydK7O1CFWJay_PoxBTcF43oyA"
      },
      %{
        name: "IVB Tickets",
        package: "at.ivb.tickets",
        icon_url:
          "https://play-lh.googleusercontent.com/HzrZRSUYW12jV6JLpp8D9XE4MOPBpGrMnZKQ-99VN8RoRf561eC96zqHwsII-5V6kDE"
      },
      %{
        name: "Imgur",
        package: "com.imgur.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/hYdIazwJBlPhmN74Yz3m_jU9nA6t02U7ZARfKunt6dauUAB6O3nLHp0v5ypisNt9OJk"
      },
      %{
        name: "IndOASIS",
        package: "com.IndianBank.IndOASIS",
        icon_url:
          "https://play-lh.googleusercontent.com/LGtygldnmgC4ji-3ZqfU78iXolZbVw1fjHOxKlmsOui2ZjltZg4TkHzEkO2-yCnSprZf"
      },
      %{
        name: "Infinity for Reddit",
        package: "ml.docilealligator.infinityforreddit",
        icon_url:
          "https://f-droid.org/repo/ml.docilealligator.infinityforreddit/en-US/icon_k3rHUumkceuBhQzl7CBHaIMfJn_o1lRDPP4ldA3I7Zw=.png"
      },
      %{
        name: "Infomaniak kDrive",
        package: "com.infomaniak.drive",
        icon_url:
          "https://f-droid.org/repo/com.infomaniak.drive/en-US/icon_pVN7j7qH9BNWPsaLlKuf-Nd3LA2pJBNtLMss9LzJrRA=.png"
      },
      %{
        name: "Infomaniak kDrive",
        package: "com.infomaniak.drive",
        icon_url:
          "https://f-droid.org/repo/com.infomaniak.drive/en-US/icon_pVN7j7qH9BNWPsaLlKuf-Nd3LA2pJBNtLMss9LzJrRA=.png"
      },
      %{
        name: "Inoreader - News App & RSS",
        package: "com.innologica.inoreader",
        icon_url:
          "https://play-lh.googleusercontent.com/XnhtKpOtqfWbpbqz919wr_FvWum1mf3MJfvIXadR3ALROeQYf9_IPziBxrxOTKMGQg"
      },
      %{
        name: "Inshorts",
        package: "com.nis.app",
        icon_url:
          "https://play-lh.googleusercontent.com/lvAGNNFIBMC3ZgS-JJcSwDzpSjOGMg7FGY14FrffJobLOed9-H2DiuZwknsIwVwKwTjo"
      },
      %{
        name: "Insight timer - Meditation App",
        package: "com.spotlightsix.zentimerlite2",
        icon_url:
          "https://play-lh.googleusercontent.com/5nhGeNbFEhYY63llcC_sgnXkgwnWRqQ6tshDg8ySTf-vHWK-DPGMqwGrnR9ca670eSYb"
      },
      %{
        name: "Instagram",
        package: "com.instagram.android",
        icon_url:
          "https://play-lh.googleusercontent.com/VRMWkE5p3CkWhJs6nv-9ZsLAs1QOg5ob1_3qg-rckwYW7yp1fMrYZqnEFpk0IoVP4LM"
      },
      %{
        name: "Inware",
        package: "com.evo.inware",
        icon_url:
          "https://play-lh.googleusercontent.com/Q_NgNyjksBqSmMP6uqwBTNOrJFmUJmMZHmrg2um1hGv8Tfq8Tt8PBksR0fMyb9GLCsKC"
      },
      %{
        name: "Jabra Sound+",
        package: "com.jabra.moments",
        icon_url:
          "https://play-lh.googleusercontent.com/olL_F_hsNwAu9rVbVUvRJO4pU9FwDZafry7dh_LVoxgHd4RBn62egxMLjMVdjbr8Bryw"
      },
      %{
        name: "Jango Radio",
        package: "com.jangomobile.android",
        icon_url:
          "https://play-lh.googleusercontent.com/-atlWsSkVuSzuqHt0XA9bNS2wxTd59GjqsMzMAw7QEY11FzPr-Um8LRgbarywQW2o8c"
      },
      %{
        name: "Japanese Dictionary Takoboto",
        package: "jp.takoboto",
        icon_url:
          "https://play-lh.googleusercontent.com/iIzqTKnI-DPO4uzSNZKZj7DZiO81c2jIOYD4XDJqXntvTT0Yx25l0LrLZ0anu1hTQOQ1"
      },
      %{
        name: "Jeff Clark Mobile",
        package: "com.jeffclarktrader.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/h3hLOQ6p4pyQCmV6C5FvuKHr1p0Hw6FIHYcNHemE8FSF-JOky76HPdBHXQ7OrZv-JNji"
      },
      %{
        name: "Jetpack Joyride",
        package: "com.halfbrick.jetpackjoyride",
        icon_url:
          "https://play-lh.googleusercontent.com/UnBJS2kf5Dw6HyZXF9TvcRBTwIkcaT59mXX26juBUCwlqHZ8bKhZRtuRZ2q4YrT7iaE"
      },
      %{
        name: "JioPages",
        package: "com.jio.web",
        icon_url:
          "https://play-lh.googleusercontent.com/VFoxH-F1aQwy7wOaZxJngtYcRuwdRu_4QtfsfJOamVsPUr3YdoRSN02AIul9soG5qFQ"
      },
      %{
        name: "Joplin",
        package: "net.cozic.joplin",
        icon_url:
          "https://f-droid.org/repo/net.cozic.joplin/en-US/icon_4ZwOYOFQVDhqRaKMUYxpj6hJJLijV8EYZJ7gWBML6ZM=.png"
      },
      %{
        name: "Jumbo",
        package: "com.jumboprivacy",
        icon_url:
          "https://play-lh.googleusercontent.com/d9xIv_bUY-cyXv8AQjn1lpNYRtMw8uZnydAdO_NTUXF355X_ooxjnJVVCvm6NKWX2yY"
      },
      %{
        name: "KFC - Order On The Go",
        package: "com.yum.kfc",
        icon_url:
          "https://play-lh.googleusercontent.com/NnzW_iKDbRtWXL_am1Ua2K72uSHMUdDze4zsd77PDq0FCAy_33uVC6-UR2dQyn2hmu2r"
      },
      %{
        name: "KWGT Kustom Widget Maker",
        package: "org.kustom.widget",
        icon_url:
          "https://play-lh.googleusercontent.com/4I0r92jtWwSNfz6S9eZIS-D3Q4o2ODBw3NCvx50ctS11Tv4iY5UmhjqMJ2hePgjHYWY"
      },
      %{
        name: "Kaloricke Tabulky",
        package: "cz.psc.android.kaloricketabulky",
        icon_url:
          "https://play-lh.googleusercontent.com/2iCmRbFEwEs7yVpGHiJm-1iUktUVb5fikCvKfIR5EWbjqkcsepwahnn7D1pd7gIQfdpj"
      },
      %{
        name: "KartaView",
        package: "com.telenav.streetview",
        icon_url:
          "https://play-lh.googleusercontent.com/oLc5pRwLTEwtuFtHLU76goO-hLlgMcMSqtupGhiUEu-UByT9dkAdwKoOInIA3aYzCi0"
      },
      %{
        name: "Kasa Smart",
        package: "com.tplink.kasa_android",
        icon_url:
          "https://play-lh.googleusercontent.com/HH2EMJy6xdJX9WM72G5LJ8SRzACsxCSjPKCNYiHdNuSiij1M4v5W-3XLzXVXVuhWnKA"
      },
      %{
        name: "Kate Mobile for VK",
        package: "com.perm.kate_new_6",
        icon_url:
          "https://play-lh.googleusercontent.com/fCEL_ORrwZjRtJg_KI6AiqXyu1Gg6qsIvQOWNX25c0YFrMQ0Jz93RCNEGFWMctkVUuc1"
      },
      %{
        name: "Keeper",
        package: "com.callpod.android_apps.keeper",
        icon_url:
          "https://play-lh.googleusercontent.com/YsyGTAx0w5vlzSE_l3gF_Nm8hKyxw8wSjtbKOmcm-elPLuCOlR-D5wBucNUQup6FCTQ"
      },
      %{
        name: "Keybase",
        package: "io.keybase.ossifrage",
        icon_url:
          "https://play-lh.googleusercontent.com/n21SI6spBy0lWLTN0Z9hkB1KKy9b0iBxicVyRGgjHOp43HC1wXxv3UxCjuxkBAmBZw"
      },
      %{
        name: "Khan Academy",
        package: "org.khanacademy.android",
        icon_url:
          "https://play-lh.googleusercontent.com/TpK0AcjPn5-XDKgSZ5jAob1H7MsQuJILOMR4M4QYkTt5CBPgTJVr7mysrKM6Ia8SrX8"
      },
      %{
        name: "Kindertap",
        package: "com.dert.kindertap",
        icon_url:
          "https://play-lh.googleusercontent.com/ov0c3xkxg3LcCjYjftMYpLV8nKSY0bDfql7YbQJIWWmztogBoqCw5K3NbiTZBxS7Xw"
      },
      %{
        name: "Kiwi Browser",
        package: "com.kiwibrowser.browser",
        icon_url:
          "https://play-lh.googleusercontent.com/IpPy16lik1fLrJs0fkaFuKrUm6Hw9Q3KDa2gLbewoze0Ko39gEIOyDECYOZBFJLHGeo"
      },
      %{
        name: "Kiwibank Mobile Banking",
        package: "nz.co.kiwibank.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/beZXQGHskyXBOEl3A8iA-IVkhacbaErYdq6zmhPaJ2LOjwHhCqK4IhO7KeLl4iIGaFM"
      },
      %{
        name: "Kodi",
        package: "org.xbmc.kodi",
        icon_url:
          "https://play-lh.googleusercontent.com/RQvf62YkkS_hpGAfP2iBoT2yf7b0oohFQHhBB8Chp8nHNPSqmZgEkwwpKtqdtqQ_ZvM"
      },
      %{
        name: "Komoot",
        package: "de.komoot.android",
        icon_url:
          "https://play-lh.googleusercontent.com/Pbr3n81ImNUpAwhWBWQ_eytF26cNMoMF0b4YwroXGk7xyB_Ur-DsNibiukTVCIBi9ic"
      },
      %{
        name: "Koofr",
        package: "net.koofr.app",
        icon_url:
          "https://play-lh.googleusercontent.com/ve98bHOY92A3f_fUs8n7OZ1OUGQCBc-CC4GnDrYCB1EM9n3O2O79bCLhIT6zxQq9MtA"
      },
      %{
        name: "Kraken",
        package: "com.kraken.invest.app",
        icon_url:
          "https://play-lh.googleusercontent.com/4pUbHE_DT1_FtGjcoUyCsQMJLl9g8THXYQd6TrCOjaVa5tLpDNxnnMLluXN5cwYh3xs"
      },
      %{
        name: "Kraken Pro",
        package: "com.kraken.trade",
        icon_url:
          "https://play-lh.googleusercontent.com/gIMLdwtmdhTm_C6S90KsZbxVUq6W3nI5hMBOC2cpuAZ9vv_M7CohaJHYnPT8BPo54Mwl"
      },
      %{
        name: "L'Appli Societe Generale",
        package: "mobi.societegenerale.mobile.lappli",
        icon_url:
          "https://play-lh.googleusercontent.com/kEQclBQQQhoBxLkanmduM-FQNgsqYZYyTo-BYcSKTBiig_Qdbc3rsUc3r3-n6_GXcNDQ"
      },
      %{
        name: "LBRY",
        package: "io.lbry.browser",
        icon_url: "https://f-droid.org/repo/icons-640/io.lbry.browser.17011.png"
      },
      %{
        name: "LIFX",
        package: "com.lifx.lifx",
        icon_url:
          "https://play-lh.googleusercontent.com/k61DT9oYt_BPdzjAFokLY5e-He-YSl7-eZHeieaVO45XDAwQ6ebegsS_ZsQytca2zWM"
      },
      %{
        name: "La Banque Postale",
        package: "com.fullsix.android.labanquepostale.accountaccess",
        icon_url:
          "https://play-lh.googleusercontent.com/Hrrx5V12MqgopMCI1dPDLrBfnGkHpQ-iW1hdxTPogmE8ZIRuWdGemQonCVl8jAm6tA"
      },
      %{
        name: "La Redoute",
        package: "com.ocito.laredoute",
        icon_url:
          "https://play-lh.googleusercontent.com/sL7l4TC7uBagfGK3hBFup4hM7GygK0QDXONdgTQFrFVEeaZyw7s6PcSZTTSYzsWvLdE"
      },
      %{
        name: "Last.fm",
        package: "fm.last.android",
        icon_url:
          "https://play-lh.googleusercontent.com/VFmAfWqcuV3aReZG8MMQdHRSdKWx85IW22f4RQ5xhR5U-o1_u03P7TVwsnTYa26Q1No"
      },
      %{
        name: "Lastpass Password Manager",
        package: "com.lastpass.lpandroid",
        icon_url:
          "https://play-lh.googleusercontent.com/BPgJq2T40gw219T9wcXPld0urrii1L9WwGZ0xovChB7fy-KFfVlKPE6oT5D7lIeQRecJ"
      },
      %{
        name: "Ledger Live - Web3 Wallet",
        package: "com.ledger.live",
        icon_url:
          "https://play-lh.googleusercontent.com/mHjR3KaAMw3RGA15-t8gXNAy_Onr4ZYUQ07Z9fG2vd51IXO5rd7wtdqEWbNMPTgdqrk"
      },
      %{
        name: "Let's Meditate: Meditate, Relax & Sleep",
        package: "com.meditation.elevenminute",
        icon_url:
          "https://play-lh.googleusercontent.com/sLqVRnCibDIruDS3EZVfrQlf7Ip4HFBEUb8lzgc9ZyLk14iwsNwy11tv_hFC-D0t"
      },
      %{
        name: "Lichess  Free Online Chess",
        package: "org.lichess.mobileapp",
        icon_url:
          "https://play-lh.googleusercontent.com/5bZvh2nmZ-2B-kcKTuATofj5bhscTrJqveAHGYVoJKalfFOMEgx2VnyOth7oJ8bJzQ"
      },
      %{
        name: "Lieferando.de",
        package: "com.yopeso.lieferando",
        icon_url:
          "https://play-lh.googleusercontent.com/GpwNnl9vcBoh3HeczVThFO9e_GS8pAjsiSt4G2ZsMYJEt-2ArWoXOREi9NC0yprpxvU"
      },
      %{
        name: "Life360",
        package: "com.life360.android.safetymapd",
        icon_url:
          "https://play-lh.googleusercontent.com/AxZFJIQK5sr8KXkko0jBH5SolEbpM_8W8q7h3EZNeTNWTeZi-G3kp2OTbrqo--X24H4"
      },
      %{
        name: "Lifesum",
        package: "com.sillens.shapeupclub",
        icon_url:
          "https://play-lh.googleusercontent.com/EksxpCD83ryNH0jAur3xxfseKV2cCU3hClEkdem0gG7IEOcET-nUNreoz2XsKfnX1cw"
      },
      %{
        name: "Lime - Your Ride Anytime",
        package: "com.limebike",
        icon_url:
          "https://play-lh.googleusercontent.com/WYmPh0ATh5gFTLzgG-9sDxXhWqYI_jCMDJ9hfrjqEdlX3Nw0WVzfCvNVychSdtnlZQ"
      },
      %{
        name: "LinkedIn",
        package: "com.linkedin.android",
        icon_url:
          "https://play-lh.googleusercontent.com/kMofEFLjobZy_bCuaiDogzBcUT-dz3BBbOrIEjJ-hqOabjK8ieuevGe6wlTD15QzOqw"
      },
      %{
        name: "Listen Audiobook Player",
        package: "com.acmeandroid.listen",
        icon_url:
          "https://play-lh.googleusercontent.com/AJKbju4Ku3RSxY6B3qmpUc1eF-vE0hzodLJm5KwgI5TEUySWR83lb_XcmssxQYZz4g"
      },
      %{
        name: "LiveScore",
        package: "com.livescore",
        icon_url:
          "https://play-lh.googleusercontent.com/ZaslmjEgpyxlF9mAyzMjngN9DXzVJ2p_1lWlb9WmvcYrwEW5ETS1d6jIDaFOcDEN5AxV"
      },
      %{
        name: "Lloyds Bank",
        package: "com.grppl.android.shell.CMBlloydsTSB73",
        icon_url:
          "https://play-lh.googleusercontent.com/Vx5qgVYRW8Q_dF1pA7cW5cW3qEioDuVFZyRm0mcn8PPMLnWATcV7Q5FzkwJlere6bh9H"
      },
      %{
        name: "Local Kitchen (  )",
        package: "com.fastrunkitchen",
        icon_url:
          "https://play-lh.googleusercontent.com/X3onS5bBUSBNr-LD1sxdIagfwhpXwBciPQVvTaMHOs1oGDIxQtw2K2KWUN96hBNlG9Mb"
      },
      %{
        name: "Locals.com",
        package: "com.locals.localsapp",
        icon_url:
          "https://play-lh.googleusercontent.com/YoFDkc4Bx-uC-BYL_WFmzwjKNJYevq6NYG8dEwygnuRBza9-8QzxefSHPAJPSZRH7A"
      },
      %{
        name: "Louis Vuitton",
        package: "com.vuitton.android",
        icon_url:
          "https://play-lh.googleusercontent.com/4EWXwRk5Lu_bt2cpfxEcdu2IFtIEmWeUDwuMt3-p6XVUq4zwCy2fIO1kMcwF7140fZ0V"
      },
      %{
        name: "Lucidity - Lucid Dream Journal",
        package: "ch.b3nz.lucidity",
        icon_url:
          "https://play-lh.googleusercontent.com/kWsTGkaDbDMWo3CUFdyeHjuntPrA9n1FZC_9muYxMSaIW3gqx_1hKo08tn5-ozFEGGDE"
      },
      %{
        name: "Lyf Pay",
        package: "com.fivory.prod",
        icon_url:
          "https://play-lh.googleusercontent.com/8mCnyfUEyynkQuANk9_vA-A58sv-KikRk9Mlh0iHDE46Zr6aTZqqNyGA-TsZ1nt29qg"
      },
      %{
        name: "Lyft",
        package: "me.lyft.android",
        icon_url:
          "https://play-lh.googleusercontent.com/ACQqLgO-aRSvB-t4TOPtJBjH-KdUA3BUpcrk1LQv5CPrxtL0JaQKeCL1AhygE4kHqg"
      },
      %{
        name: "MAPS.ME",
        package: "com.mapswithme.maps.pro",
        icon_url:
          "https://play-lh.googleusercontent.com/Ec9fzB4pWGEvKnJHXAyrikd38aEY0PPKmhZ9S2c-lmwRc70yCUUsfeuNqAZexuNtwRw"
      },
      %{
        name: "MEGA",
        package: "mega.privacy.android.app",
        icon_url:
          "https://play-lh.googleusercontent.com/LPje8jSAa7MHJt4xaJUXn-aYy7LfFyKbc0HJuuf3c5__k7_9DbOJkwlVHvrdQ--kDvYp"
      },
      %{
        name: "MVG Fahrinfo",
        package: "de.swm.mvgfahrinfo.muenchen",
        icon_url:
          "https://play-lh.googleusercontent.com/a0eRD48JCWPMrqQTi3EUovHkzniLMr5gUNwPhPx-Z-RABCk4O-5b5IikzHQ6HqiGiw"
      },
      %{
        name: "MX Player",
        package: "com.mxtech.videoplayer.ad",
        icon_url:
          "https://play-lh.googleusercontent.com/e_rNLzyR9i3wwy8BwEsIS4uz0fFu29p5RoXoNZt2L0Ef7cJ2QhAcw1x_K51A19HpzQ"
      },
      %{
        name: "MY DIOR",
        package: "com.lvmh.tom.mydiorapp",
        icon_url:
          "https://play-lh.googleusercontent.com/KXQRr_CBLr6HZ65WChX6oMyB3P19FyQITTeGMbg5UFE0g0EmZbc0UqgTfGM9WwC5gbk"
      },
      %{
        name: "Ma Banque (Credit agricoles)",
        package: "fr.creditagricole.androidapp",
        icon_url:
          "https://play-lh.googleusercontent.com/27vUlTrWVJlZs1HdYaJpf27rlUyEpONP_iynhP1KtfVIVNkZvXRKCufpezyeBk1VUh4"
      },
      %{
        name: "Magic Earth",
        package: "com.generalmagic.magicearth",
        icon_url:
          "https://play-lh.googleusercontent.com/bC8jeHkkhk10Z8SwJVoAMZknCV18fffxZe2DIelQvdLnUnY6HE2V2o3uimZcuN3r3A"
      },
      %{
        name: "Magic: The Gathering Companion",
        package: "com.wizards.winter_orb",
        icon_url:
          "https://play-lh.googleusercontent.com/qN-ZMFT0d8lI9JBSU4vmT6h-XCGug-T_J3tX3cexowSOnPqT294Lb53qBd7hLodMYQ"
      },
      %{
        name: "Majority Report",
        package: "com.samsedershow.majorityreport",
        icon_url:
          "https://play-lh.googleusercontent.com/2QdsGzUEoyRlKYbPL6tBZLSGvKjUUq-DGvLtMB_LmrLkGcukd3tOgT21EgPPDjJ_aC4d"
      },
      %{
        name: "Mapillary",
        package: "com.mapillary.app",
        icon_url:
          "https://play-lh.googleusercontent.com/z3qzEc13E2sDWky9LgqADojcdy8hrX_szuAAeX21k_dFe7GNXLIYXJtOu5RcE3_5Jz8"
      },
      %{
        name: "Mapy.cz",
        package: "cz.seznam.mapy",
        icon_url:
          "https://play-lh.googleusercontent.com/EqUqDykotPGEMJSwuAbwiFBaqGTlnx9S4-hCJDC3HmAiAX1ocGeh3tumyArOYuiDGwk"
      },
      %{
        name: "Marriott Bonvoy",
        package: "com.marriott.mrt",
        icon_url:
          "https://play-lh.googleusercontent.com/OFd2FOQ-nnMioui-9MEQWwW-1NLlDwN9LtP1jybaPnP7t0Dm60foT9pEJism0V_Pr0A"
      },
      %{
        name: "Maybank2U MY",
        package: "my.com.maybank2u.m2umobile",
        icon_url:
          "https://play-lh.googleusercontent.com/dEcCRYBuzpFUd2R_ZjTfPxKbRrZoiNoMiO2QULQu17k1jI9itzDQ4QM7kjMI_eFyRaI"
      },
      %{
        name: "Mcdonalds",
        package: "com.mcdonalds.mobileapp",
        icon_url:
          "https://play-lh.googleusercontent.com/0loj-whL4XSeF4v5W3d213b1pH0RRTQUlmK1VESE-Rsydp06rVyPTq_Hwpwm1avB8URL"
      },
      %{
        name: "MeWe",
        package: "com.mewe",
        icon_url:
          "https://play-lh.googleusercontent.com/MXxTMo9fY9vq7gpXCR6wNgl9wwthyVr0j3qxYAUFxODn54-T4LqN3c8r7cIqHwfvdS8"
      },
      %{
        name: "Memedroid Pro",
        package: "com.novagecko.memedroidpro",
        icon_url:
          "https://play-lh.googleusercontent.com/ijWUdLG6BxYhhsyq2CcGheLbiqcDj-sahxZx05uFUhMINhYf5_golnqM4_pQT6hNpyve"
      },
      %{
        name: "Memrise",
        package: "com.memrise.android.memrisecompanion",
        icon_url:
          "https://play-lh.googleusercontent.com/eooMtOtVjJzq7fCS4G--Iy3jY8QvFEzdsoWMcO5Z_mJOilep2Wu_aZLJjTP9SOF_9jU"
      },
      %{
        name: "Merlin Bird ID by Cornell Lab",
        package: "com.labs.merlinbirdid.app",
        icon_url:
          "https://play-lh.googleusercontent.com/8okG2k2RQWo3qafzjRr1_8haEDH8Pa7SI1PPNgUfNHe51SOxGcdkDvXPrv7Dk-FFLVEJ"
      },
      %{
        name: "Merriam-Webster",
        package: "com.merriamwebster",
        icon_url:
          "https://play-lh.googleusercontent.com/dyiHgxZowtgJLfiCIoZA1V_duEiGo7jD23VNuoNj-yA9nFP6xh3khIKXev6p9z4JEuw"
      },
      %{
        name: "MetaMask",
        package: "io.metamask",
        icon_url:
          "https://play-lh.googleusercontent.com/8rzHJpfkdFwA0Lo6_CHUjoNt8OU3EyIe9BZNKGqj0C8BhleguW9LhXHbS46FAtLAJ9r2"
      },
      %{
        name: "Meteo Aeronautica",
        package: "it.meteoam.app",
        icon_url:
          "https://play-lh.googleusercontent.com/an9_c3aOurOJI20xS_TYO3NKC66Gg4u4V6HTgwcZbZH5tnoC4Ap4WmpFcGKIth3MOFo"
      },
      %{
        name: "MeteoSwiss",
        package: "ch.admin.meteoswiss",
        icon_url:
          "https://play-lh.googleusercontent.com/29CxAUAGJzCljm4XH8WzlgoHWSO90NFf_zqfzsXWaPQg3vBhqgVPQd_BvIeJZLCVSsM"
      },
      %{
        name: "Mi Movistar Argentina",
        package: "com.services.movistar.ar",
        icon_url:
          "https://play-lh.googleusercontent.com/ojH78S_bB-3S3USv_K1vIRp_5NzvKubUlb269yxSsnr88oSnfNQmPMETFnEtdiRCCWE"
      },
      %{
        name: "Microsoft Excel",
        package: "com.microsoft.office.excel",
        icon_url:
          "https://play-lh.googleusercontent.com/37EzETO6gZyKmCg2kBIFX1e9gkubxZrVa5fHJ6yOaa7VvEShHjKv2RdtwnZt9Sk258s"
      },
      %{
        name: "Microsoft Flow",
        package: "com.microsoft.flow",
        icon_url:
          "https://play-lh.googleusercontent.com/aeXs0qriXwmHVWtq9u4zVUO6SifULKtJOQdtBg6wDQqaNEaaJKl6b2oiABMmHn6yLH8"
      },
      %{
        name: "Microsoft Office",
        package: "com.microsoft.office.officehubrow",
        icon_url:
          "https://play-lh.googleusercontent.com/94uR6O49JmqiMMMsrfoDlWvWkqLf6rfE25zOH2BWnuzozzlfY1qnKaNzuQbUcupcpX9L"
      },
      %{
        name: "Microsoft OneDrive",
        package: "com.microsoft.skydrive",
        icon_url:
          "https://play-lh.googleusercontent.com/6AWr-qrhGT0ohjw0koq3bM8GHEFg1gTurald4FjCDg2RulTp4y_VVsYWUtw7Fo6lsQo"
      },
      %{
        name: "Microsoft OneNote",
        package: "com.microsoft.office.onenote",
        icon_url:
          "https://play-lh.googleusercontent.com/3Wr_nlhRHjIGfPd-BNUbgffLfxPPqNW8GFPscqnQ4t2aPRyKlFMuXT4yhb-PSMsHgss"
      },
      %{
        name: "Microsoft Outlook",
        package: "com.microsoft.office.outlook",
        icon_url:
          "https://play-lh.googleusercontent.com/Zk9elS0eGXDr0L4W6-Ey7YwHbRNjkyezHC8iCc8rWp64lNIjlByS8TDF9qDSZbiEWY4"
      },
      %{
        name: "Microsoft PowerPoint",
        package: "com.microsoft.office.powerpoint",
        icon_url:
          "https://play-lh.googleusercontent.com/6pTX4OILXTxazqad66oiVfG4x2KpYn4kIPgdzOe173tT0oHr2ThwpBhMyzzzxWq_r6M"
      },
      %{
        name: "Microsoft SharePoint",
        package: "com.microsoft.sharepoint",
        icon_url:
          "https://play-lh.googleusercontent.com/f5m1W5yi3SvVsScU43CHGqjp_YbEDnPELYDqGk-Uwv5heB-BXvScQGeYa74lAq26Xgw"
      },
      %{
        name: "Microsoft SwiftKey Keyboard",
        package: "com.touchtype.swiftkey",
        icon_url:
          "https://play-lh.googleusercontent.com/-T9LWvUtdAT4faOMnIOy0oInlZNPYquWJLFE1P0kL_R-WQvCK3nIdkqtZMkiHdCk9seW"
      },
      %{
        name: "Microsoft Teams",
        package: "com.microsoft.teams",
        icon_url:
          "https://play-lh.googleusercontent.com/jKU64njy8urP89V1O63eJxMtvWjDGETPlHVIhDv9WZAYzsSxRWyWZkUlBJZj_HbkHA"
      },
      %{
        name: "Microsoft Word",
        package: "com.microsoft.office.word",
        icon_url:
          "https://play-lh.googleusercontent.com/9kABykeGovHPy-dN19lRxxnCp8IZK3Pkl8qLFNxrEe-hhKVZeiyhTBEIRUt6t-vhxQ"
      },
      %{
        name: "Migrate - custom ROM migration tool [4.0 GPE]",
        package: "balti.migrate",
        icon_url:
          "https://play-lh.googleusercontent.com/F4-87wWfW9LHbZFGzR1-FMq9kafJP24O-w_CjnycFsMP1Q3O_PSdbzQ3lcoLrYJ1DsE"
      },
      %{
        name: "Mijn Simyo",
        package: "nl.simyo.mijnsimyo",
        icon_url:
          "https://play-lh.googleusercontent.com/rXIo--yhEMAbuWMLw6N4uShEunJcmog4tXYOhskiUMgKV4N6P0vq4AaS1BvHybINv-c"
      },
      %{
        name: "MinSundhed",
        package: "dk.sundhed.minsundhed",
        icon_url:
          "https://play-lh.googleusercontent.com/GK3181c-4oGdsaP7NxYIlq8wlymARgmQClUkw5Z9Qo5iX8tHlZQFysbuWKIFy6rD6tBv"
      },
      %{
        name: "Minds Chat",
        package: "com.minds.chat",
        icon_url:
          "https://play-lh.googleusercontent.com/fhKAKvF9LP3axX1MyihU0tflVT47a-lCjcvcRChsfy5mu0cI2gq5wvrIu9tgVEBaJSMp"
      },
      %{
        name: "Minma Icon Pack",
        package: "com.minma.icon.free",
        icon_url:
          "https://play-lh.googleusercontent.com/wEvQtonZYqNpcEURxeeO29jfGAnWq-RA7Lp49Gi3g5qpuZB93geJ_3vcBDqPvvYt6HZr"
      },
      %{
        name: "Mint Mobile",
        package: "com.uvnv.mintsim",
        icon_url:
          "https://play-lh.googleusercontent.com/R5rZPSFJux2MIKRSkwkxIbh7bPB-8uiSV0u2zZ9E7R_LsPuXRRqgzxAYa2xMeOyBlA"
      },
      %{
        name: "Mit 3",
        package: "dk.tre.smart",
        icon_url:
          "https://play-lh.googleusercontent.com/6Do6xyid-95WoSMK4oqQHAvA-RqYnDz1C2qS9FRF_f4Jz-hgFPHRdBcXWLJDfQMuDA"
      },
      %{
        name: "Mobilbank DK",
        package: "com.danskebank.mobilebank3.dk",
        icon_url:
          "https://play-lh.googleusercontent.com/ouu0nmy8KQ_5cfRmNJXBi628Um5zyV0qNKZXrOecrn1UHv_u4mpNab08Haw4T7dhTQ"
      },
      %{
        name: "Mobile@Work",
        package: "com.mobileiron",
        icon_url:
          "https://play-lh.googleusercontent.com/0HyNt2ThuZcfgrDeylMf5ySHT09wyfVxsfLNH9Hj0M7v5B_NlZFUSREtB5iVkJU_7no"
      },
      %{
        name: "Moon+ Reader Pro",
        package: "com.flyersoft.moonreaderp",
        icon_url:
          "https://play-lh.googleusercontent.com/5WKDh_lIDQOfyxrboxl72cac3E2gxw2ztm0okw8h87hp7Xek0bAqpid1ozfuhuZ2pGY"
      },
      %{
        name: "MusicBee WiFi Sync",
        package: "com.getmusicbee.musicbeewifisync",
        icon_url:
          "https://play-lh.googleusercontent.com/FHf-279TE8JoMOr3ps8JKV49IgvGnQD5qNdErHw8MZRW3KcKMtWAoO3TPZp9o-RQEby7"
      },
      %{
        name: "My EE",
        package: "uk.co.ee.myee",
        icon_url:
          "https://play-lh.googleusercontent.com/q3oppRy40rJlZs95QqQP5WitazJkkThfYShM4Vw7eEUmS7YKyhph-Xp15JebO7cNpUI"
      },
      %{
        name: "My Optus",
        package: "au.com.optus.selfservice",
        icon_url:
          "https://play-lh.googleusercontent.com/nw4KQ-mMAwWPHE5fV35Ude79WxiyQJUrDyRH4OjrNPA9IN7Ry9uZRitQd1GCJfmhseo"
      },
      %{
        name: "My Talking Tom Friends",
        package: "com.outfit7.mytalkingtomfriends",
        icon_url:
          "https://play-lh.googleusercontent.com/yXVB9nmPzMZuJFqcXtBmu6eZ2zr5_FB6YcC2oLwnS-ri9cfuFyGV0fl-zVq_wO26"
      },
      %{
        name: "MyFitnessPal",
        package: "com.myfitnesspal.android",
        icon_url:
          "https://play-lh.googleusercontent.com/RSu_Yble-5MgqnXbuqaYdj9r97Wv3yE0ICX2vDGAw2QCZPF4wZLA71Q1cEndjR1WpDM"
      },
      %{
        name: "MyJioApp",
        package: "com.jio.myjio",
        icon_url:
          "https://play-lh.googleusercontent.com/W6-GRr_DiVmMphLSzsH2Z2fGMdlM8ZLjNhKS93ALvLO3Dkfl6RejtMqlARBoA2dCw0Y"
      },
      %{
        name: "MyLebara",
        package: "com.lebara.wallet",
        icon_url:
          "https://play-lh.googleusercontent.com/bqCh1Tl8SnDrm_OYTa-xtFBgeFt6misb-ir5JsHVEnV13bIWV2iAG5fbtfRmca7b91A"
      },
      %{
        name: "MySudo",
        package: "com.anonyome.mysudo",
        icon_url:
          "https://play-lh.googleusercontent.com/NqnlSzi-bb7-IHRge-fSmLuDnUKkZxjs2Abe-3bAOi3YFWTGBh_DCGrfMyFEIhZn8Zg"
      },
      %{
        name: "N26",
        package: "de.number26.android",
        icon_url:
          "https://play-lh.googleusercontent.com/85SeCCkigrkJV5b7aHUQc07CozV1xLaIK_UZ7A1_VeeXK9k4CTMIWsXGSfQJrGYHGWs"
      },
      %{
        name: "NAB Mobile Banking",
        package: "au.com.nab.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/tMopLbqbXW8gzK7JVil3IX42GWWSZxA1YDddT7c4NVJpnSTs3qc82CEjXemxArsroA"
      },
      %{
        name: "NBC News",
        package: "com.zumobi.msnbc",
        icon_url:
          "https://play-lh.googleusercontent.com/LMulHEBd3m1bAZmO-yoZTuXA8abvwVtQd_QVPtmnuko3Setwnq90umSjjtOCXywNGvY"
      },
      %{
        name: "NETGEAR Mobile",
        package: "com.sierrawireless.mhswatcher",
        icon_url:
          "https://play-lh.googleusercontent.com/3T-XnjUveoRmtMDfKZukvD22Gs8Chf7a2Ga7cXz6atkT7lMkm6FCSc4Huz4kZ88KU3zg"
      },
      %{
        name: "NFS No Limits",
        package: "com.ea.game.nfs14_row",
        icon_url:
          "https://play-lh.googleusercontent.com/bVJdXNp1sOW-ZvsEmaabQO3-2VeXNYEjLUtm8Gc8er7ZUM-J8w_snvWQv30AFAgrNUk"
      },
      %{
        name: "NINA",
        package: "de.materna.bbk.mobile.app",
        icon_url:
          "https://play-lh.googleusercontent.com/jaF3Ui5GF6spTLisx7vJY4XGtUF-zZsN4WlzLb2mxNAb6Gy5vT7OeBJyGTjrKsP8wuE"
      },
      %{
        name: "NOS",
        package: "nl.nos.app",
        icon_url:
          "https://play-lh.googleusercontent.com/b_XfcGHCiF2D7bP44qANd185C07ywibPfYcI9fa39GS37lJ20x63cl8OLly2qJYSkQ"
      },
      %{
        name: "NS",
        package: "nl.ns.android.activity",
        icon_url:
          "https://play-lh.googleusercontent.com/mUhrRlZrFBND9-RbJOTkJuKnXwdZfcabgZXdPf7_52k8MTcwSDM8mlapseeOw4JaGSY"
      },
      %{
        name: "Nanoleaf Smarter Series",
        package: "me.nanoleaf.nanoleaf",
        icon_url:
          "https://play-lh.googleusercontent.com/2WXa6Cwbvfrd6R1vvByeoQD5qa7zOr8g33vwxL-aPPRd9cIxZWNDqfUJQcRToz6A9Q"
      },
      %{
        name: "Naruto X Boruto Ninja Voltage",
        package: "com.bandainamcoent.ninjavoltage_app",
        icon_url:
          "https://play-lh.googleusercontent.com/mZ4hUPJGIwdiRKnwaV4YifG1d-7Tici0ox9tK3wyjY3sAedY4Vdw68udDbUwzIxSTdFx"
      },
      %{
        name: "National Trust",
        package: "uk.org.nt.android.app1",
        icon_url:
          "https://play-lh.googleusercontent.com/XIAw60GUduAEV5RshmoCyRYSB56E2KZ0rIPkLvKST1XgFTaAAX4CE_Q4OoQFv3wM_g"
      },
      %{
        name: "Naver (South Korean search engine)",
        package: "com.nhn.android.search",
        icon_url:
          "https://play-lh.googleusercontent.com/Kbu0747Cx3rpzHcSbtM1zDriGFG74zVbtkPmVnOKpmLCS59l7IuKD5M3MKbaq_nEaZM"
      },
      %{
        name: "NemID ngleapp",
        package: "dk.e_nettet.mobilekey.everyone",
        icon_url:
          "https://play-lh.googleusercontent.com/s-HhNQmYm1BgeoEVxFM6PnO9Xoe61qRD93eeZz6d3X1nxQfTUw6LaVl41J504cm1UWnQ"
      },
      %{
        name: "Netflix",
        package: "com.netflix.mediaclient",
        icon_url:
          "https://play-lh.googleusercontent.com/TBRwjS_qfJCSj1m7zZB93FnpJM5fSpMA_wUlFDLxWAb45T9RmwBvQd5cWR5viJJOhkI"
      },
      %{
        name: "Newegg",
        package: "com.newegg.app",
        icon_url:
          "https://play-lh.googleusercontent.com/9o9By3LgW-2uNCk8lAeGCHFFBrJIFOGW13ULPgDqf7lHX9aLYgG4oAwUeaLwdSokGgEC"
      },
      %{
        name: "NewsBlur",
        package: "com.newsblur",
        icon_url:
          "https://play-lh.googleusercontent.com/S0AYLN1BNNpXjlN5MeYtK-73d4hPkkM5N6EuhWaIGAcVhC41JXyF9N8Lh0F4rT7A_ts1"
      },
      %{
        name: "Nexi Pay",
        package: "it.icbpi.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/Rt4AqIZ9_MNrRzyJHthKJGw3tP_nk7h-_5gjUbZ1kFokghjDO2V-9obbIO2g3G5OKPU"
      },
      %{
        name: "Nextcloud",
        package: "com.nextcloud.client",
        icon_url:
          "https://f-droid.org/repo/com.nextcloud.client/en-US/icon_uMFXKXpFQnnVroYp_Oxtrb4w_rVoRJ4Zi85v0NPY1ZY=.png"
      },
      %{
        name: "Nextory",
        package: "com.gtl.nextory",
        icon_url:
          "https://play-lh.googleusercontent.com/gNbRBCju64N-qbtSGctVs4vmWSL0Rx5PxaQkrJ_z2Abbsh3d0qtwYpGL8AF7Sv8gyw4"
      },
      %{
        name: "Nine",
        package: "com.ninefolders.hd3",
        icon_url:
          "https://play-lh.googleusercontent.com/NaiwXsBjUYw9AakhpyQQG4SVKgPeZjrcIhb8xWkurvYulGJrzFCaMaIP3XGWOlBqmHoW"
      },
      %{
        name: "NordVPN",
        package: "com.nordvpn.android",
        icon_url:
          "https://play-lh.googleusercontent.com/X8hJVUEzH6Q5N0g5npd0gz4rYPmvSek1ScQL8cmnIa8bLtXeAcRQJbLaoBAL-4YXIQ"
      },
      %{
        name: "Nordea Wallet",
        package: "com.nordea.mep.npay",
        icon_url:
          "https://play-lh.googleusercontent.com/hicLCT5PcMqMPlcmoduLEiSPk1IW8Rb8awJ1LfPqhS83VLqFMwHhUP4k7UppsD9Nlw"
      },
      %{
        name: "Nothing ear(1)",
        package: "com.nothing.smartcenter",
        icon_url:
          "https://play-lh.googleusercontent.com/aIZ-ZHhWl3Pq86g1hq8gWxLF4LukJZU4UXB7G-y0Nf7z2hsnbv1Bfs41n5PVUJFWPyg"
      },
      %{
        name: "Notion",
        package: "notion.id",
        icon_url:
          "https://play-lh.googleusercontent.com/NnKT3bbUErmWcnRQu-xui8KvOSC_j_genDLnMv1acjTInMiiIQ9rAShWZzzUPPeyMqM"
      },
      %{
        name: "Nova Launcher",
        package: "com.teslacoilsw.launcher",
        icon_url:
          "https://play-lh.googleusercontent.com/Et6Ha-3AtD1XVbSHn68xCRFkQcPiZIKnl2q5y9EoRT5Y7u2NHRb35ii_Jot-hNLfvv3y"
      },
      %{
        name: "OBB Scotty",
        package: "de.hafas.android.oebb",
        icon_url:
          "https://play-lh.googleusercontent.com/LZndhNtBidPXWNjannzK1JpOo9lTNQ6Llb7JA8mdcd-5BnVFbLKUx_hUu1kp5haMr9zY"
      },
      %{
        name: "OTG View",
        package: "com.dingtai.snakecamera",
        icon_url:
          "https://play-lh.googleusercontent.com/2T8DjDW6fTvOyl0hmdx8dQ_-UNH1UpsgBEKrvINOe2WeBagrcoZ6GxsamtbIRDNerQ"
      },
      %{
        name: "Oculus",
        package: "com.oculus.twilight",
        icon_url:
          "https://play-lh.googleusercontent.com/TtK35FoW6K5NE1dJqe1oj0N4ipJIJNdIk9jhe-2G0UEAdWNa1bWB5tdcfm4eQ2fXjA"
      },
      %{
        name: "OkCupid",
        package: "com.okcupid.okcupid",
        icon_url:
          "https://play-lh.googleusercontent.com/paVjCzUNZBzQ8RI4TttQGM7PpW2IZuFgT_ryeAYs-mBBDWk2q7cX8bv6-_t2hnI5hZo"
      },
      %{
        name: "Okta Verify",
        package: "com.okta.android.auth",
        icon_url:
          "https://play-lh.googleusercontent.com/IOMxgXpJHi-Yk3ukLH0HFKPqoP7rJWeQusgGJ4ZnijcYffbvIzw8ldWUla0frMV_g1Q"
      },
      %{
        name: "Omega Digi Bible",
        package: "com.app.vsionteq.omegadigibible",
        icon_url:
          "https://play-lh.googleusercontent.com/E8N7AkiTTEtk_7PJnG7hHaT57zdpLkzaij17rVhoehqDP7CewiZi-Qrhfwcrcg5C7_is"
      },
      %{
        name: "Omnivox Mobile",
        package: "com.skytech.omnivoxmobile",
        icon_url:
          "https://play-lh.googleusercontent.com/-djSBZeHrGMlBkEBseCzNM5JP7lT9CaLEVm8vsoh0nDySsonHlggFBepxjtEvZYZFzM"
      },
      %{
        name: "Onoff",
        package: "com.onoffapp.app",
        icon_url:
          "https://play-lh.googleusercontent.com/KDbfRHKbBVGukacslSdo_s-oIySEQKE0x_fba6otUWFeWyiKVHKnUosoOU2i-J1ETA"
      },
      %{
        name: "OpenPhone",
        package: "com.openphone",
        icon_url:
          "https://play-lh.googleusercontent.com/ZH-28KcgG6X3yRy_72aTO-YCKzPK1L31FXD6wERTUQPNNkTgvacB_ZFAYJcB5k0SgA"
      },
      %{
        name: "Opera Mini",
        package: "com.opera.mini.native",
        icon_url:
          "https://play-lh.googleusercontent.com/OMqej9WONG1l8CXOgFH58XV1cGRgTcJxeffDiEXmkjkfLPK-g680lkzXGhJ7VMTmII4"
      },
      %{
        name: "Opera Mini beta",
        package: "com.opera.mini.native.beta",
        icon_url:
          "https://play-lh.googleusercontent.com/XoIeAvLLoRXmvc7Tu347i9gElh2DMFhJAqCFhCvgeWh7pk0tbNFx51Idnd8dbWvnzb4"
      },
      %{
        name: "Opera beta",
        package: "com.opera.browser.beta",
        icon_url:
          "https://play-lh.googleusercontent.com/6dk03ivZpv4CSxxEC-W4sETvbo8XPRhLzya4LrZPr-VkvONeAcpdnqTod6cKd3rCnwY"
      },
      %{
        name: "Opera browser with VPN",
        package: "com.opera.browser",
        icon_url:
          "https://play-lh.googleusercontent.com/tkwW6uWRyX7Weduiqz8y26b-ks4NTQjtILg50srjSuN1c2UZj3mxpWD2cBme51gp6Q"
      },
      %{
        name: "Oxen Wallet",
        package: "io.oxen.wallet",
        icon_url:
          "https://play-lh.googleusercontent.com/jzRzro0MYM1cGb3rK9R-BVHSc0fWJxVsueD7DmDm6ea1P-cswn6PdPNAnGq9yNAzhzo"
      },
      %{
        name: "Oxygen Updater",
        package: "com.arjanvlek.oxygenupdater",
        icon_url:
          "https://play-lh.googleusercontent.com/ler7uQWDGyPsfJGD-aYaZrjKx8jJQCiGyIKdYDjPAyw8UObIk-oltiW_X43Pc9Z_yM1P"
      },
      %{
        name: "PAKO",
        package: "com.treemengames.pako",
        icon_url:
          "https://play-lh.googleusercontent.com/WsCUbrymL__LazQG2SjWTzXMlBUjdEggCInE1oz31w3rDu5K7xye3AaFY_wY2Fl2IUY"
      },
      %{
        name: "PAKO 2",
        package: "com.treemengames.pako2",
        icon_url:
          "https://play-lh.googleusercontent.com/iX-YoGKrxzJmNBbD_x-2iXF4dEBXXhG5XHUZmvFRFfT8WcfMQ-IN7g74tPdRe3tn_2ky"
      },
      %{
        name: "PESU",
        package: "pes.pesu",
        icon_url:
          "https://play-lh.googleusercontent.com/5OUK2rqyCA1rVe_NHjXZiKJ2HficO5PC7fmwP62LHusOc6iu0lYVhYb1ZkBaOg5B9_KP"
      },
      %{
        name: "PagerDuty",
        package: "com.pagerduty.android",
        icon_url:
          "https://play-lh.googleusercontent.com/E-zhAf4KJ6JDDXmQfQxBprn2sATGYUMkOEqLQX5HAQQtiwDZJg4c8sQd7deb6nCZCwU"
      },
      %{
        name: "Palm Beach Research Group",
        package: "com.palmbeachgroup.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/RmUHAHUl7aY_EqfIiSXVUpwDuoEtuYrgTQyEwJWrK7TTUOSf1JIf9sVojQT4AgTZjHw"
      },
      %{
        name: "ParkMate",
        package: "io.pspot.user",
        icon_url:
          "https://play-lh.googleusercontent.com/fGpr1oovSU6QAxUA0H3mw9jy8fofefXy7dRF7KSET4p8HjjveyWJHxWq-L09pEYQlQ"
      },
      %{
        name: "Patreon",
        package: "com.patreon.android",
        icon_url:
          "https://play-lh.googleusercontent.com/mGb9igccuINK7_E25XepzEsGDW9aHve8-dLA786yuC4q93tn-WPnuI8ARz4DnfsVFf4"
      },
      %{
        name: "PayMyPark",
        package: "nz.co.adriley.paymypark",
        icon_url:
          "https://play-lh.googleusercontent.com/c7gUUKDUUetN8nmFaCD3pY64oETb5nbmHAARetBEjh2MmdrU7TopZm88jJzevynVzA"
      },
      %{
        name: "PayPal",
        package: "com.paypal.android.p2pmobile",
        icon_url:
          "https://play-lh.googleusercontent.com/bDCkDV64ZPT38q44KBEWgicFt2gDHdYPgCHbA3knlieeYpNqbliEqBI90Wr6Tu8YOw"
      },
      %{
        name: "Paysera Mobile Wallet",
        package: "lt.lemonlabs.android.paysera",
        icon_url:
          "https://play-lh.googleusercontent.com/nu0P7DN1yTD3PG4Zdobu0om3vgc1fqwhgI_iYOAFsjr-9mW-qmQ-mPhu66qoscklgXY"
      },
      %{
        name: "Perfect Piano",
        package: "com.gamestar.perfectpiano",
        icon_url:
          "https://play-lh.googleusercontent.com/x9HL-yzNmqTQp6ENzRity_7AmBr9CsuhrmgAfeYt5VHb-834i1GsduPmi0-RCCFt0tI"
      },
      %{
        name: "Phillips Hue",
        package: "com.philips.lighting.hue2",
        icon_url:
          "https://play-lh.googleusercontent.com/FUlW6h3cACamheiCHH1cE67irohAZq_dJ92irK92cryKwHUtY6ZTSv5d041qPZ9UOt3n"
      },
      %{
        name: "Phimp.me",
        package: "org.fossasia.phimpme",
        icon_url:
          "https://play-lh.googleusercontent.com/h_uwLYx86zbJZMvqNQDdNGQnCbG7c_ohGpCq_Vei3vyyjCaj9cfoA8crzDFyGcevZYrf"
      },
      %{
        name: "Photomath",
        package: "com.microblink.photomath",
        icon_url:
          "https://play-lh.googleusercontent.com/E_kpq1HGn5WU2P4S2yu0BwrPEHqiA-VBh2R7qoIjPFXdNvKA0A-8zi0RzRslUtEOnUvA"
      },
      %{
        name: "PhysiApp",
        package: "com.physitrack.physiapp",
        icon_url:
          "https://play-lh.googleusercontent.com/tfw0FEQW6SHn_CsdaERBMAtys-LIPTHaRoZbVzVx8pWb53efyQeY1QfKy5_FdEqBOfM"
      },
      %{
        name: "PicPay",
        package: "com.picpay",
        icon_url:
          "https://play-lh.googleusercontent.com/pTvc9kCumx_24eJDwGUpvcBwljcIBkrsL3qHwhBW2NalMQ-XxTtHRV9YAJanBxkV0Rw"
      },
      %{
        name: "Pinterest",
        package: "com.pinterest",
        icon_url:
          "https://play-lh.googleusercontent.com/dVsv8Hc4TOUeLFAahxR8KANg22W9dj2jBsTW1VHv3CV-5NCZjP9D9i2j5IpfVx2NTB8"
      },
      %{
        name: "PlantNet Plant Identification",
        package: "org.plantnet",
        icon_url:
          "https://play-lh.googleusercontent.com/6p_UoXPjovHWARuVaOilwZzjIOzqltetjYkE9eQ9L9ZhgBb2Fbbl8LkVCf-k64k8Fw"
      },
      %{
        name: "Plex",
        package: "com.plexapp.android",
        icon_url:
          "https://play-lh.googleusercontent.com/slZYN_wnlAZ4BmyTZZakwfwAGm8JE5btL7u7AifhqCtUuxhtVVxQ1mcgpGOYC7MsAaU"
      },
      %{
        name: "Pocket",
        package: "com.ideashower.readitlater.pro",
        icon_url:
          "https://play-lh.googleusercontent.com/Jgl7C0anIk2AVTWq-an0dV3HS8pvP-_UIyrTifrNGxcReZT9hQ-LWUQ-I3oh94_IpA"
      },
      %{
        name: "Pocket Casts",
        package: "au.com.shiftyjelly.pocketcasts",
        icon_url:
          "https://play-lh.googleusercontent.com/23K9TDTOdlo57Pi9JvNtPc9K-utruK6jQEpQGD_E4QBLRJYRAgLcC7gF2Rd_0T1qhLLS"
      },
      %{
        name: "Pocket Tanks",
        package: "com.blitwise.ptankshd",
        icon_url:
          "https://play-lh.googleusercontent.com/eqh1Wgc4IaJwlVDKdOMhJgqIDzcTUdEe0UVBLHsCwOc03uC7aukTrddOcD_D9V1EWA"
      },
      %{
        name: "Podcast Addict",
        package: "com.bambuna.podcastaddict",
        icon_url:
          "https://play-lh.googleusercontent.com/m6FeLOkUfP8qTZNXKFSSI8_exI-SlGJRcIArl3gRm3-VninL7l1RdYlPkkf2CfbBnA"
      },
      %{
        name: "Podcast Player App - Podbean",
        package: "com.podbean.app.podcast",
        icon_url:
          "https://play-lh.googleusercontent.com/jFcFj9dMkjXDlbywqBhU498AqdDySYD0KFOU88HL0POOrdSzDO9IO3WMGYoDHEvo"
      },
      %{
        name: "Pokemon Go",
        package: "com.nianticlabs.pokemongo",
        icon_url:
          "https://play-lh.googleusercontent.com/MDaSgXlbRkftfjNIdJ2oHodVBVLOmVg2PevfdzJkbtlawfMA-8gMAs-kCfXXY5XyLw"
      },
      %{
        name: "PosteID",
        package: "posteitaliane.posteapp.appposteid",
        icon_url:
          "https://play-lh.googleusercontent.com/OUhGXkEBAOpeGtN3B6bROVlcurnXiKmeKehU20vmRdre5J3gjkIUHiV_q2nAfS0SSw"
      },
      %{
        name: "Poweramp",
        package: "com.maxmpz.audioplayer",
        icon_url:
          "https://play-lh.googleusercontent.com/heuNK1GfamfVDX4ct0jwLzTZSp2LkJoKrVpDW3iwJrdcfoAP1vwuxsjBidyjLXa-7APU"
      },
      %{
        name: "Prank Master 3D",
        package: "com.alphapotato.prankster",
        icon_url:
          "https://play-lh.googleusercontent.com/lVZUf-rhJl9tTMwsaqMLg_15TkvFDoSiVmF8ZnOjXscCdCSpKBjlKuJXvItKexltI8w"
      },
      %{
        name: "Pronote",
        package: "com.IndexEducation.Pronote",
        icon_url:
          "https://play-lh.googleusercontent.com/zMiGwnxDPRH0pseGALVVc6T7JdvdfpDoygm8Ska7m4fFKJ3hodY3DfwCjT-UiJUy6g"
      },
      %{
        name: "Proton Calendar",
        package: "me.proton.android.calendar",
        icon_url:
          "https://play-lh.googleusercontent.com/v1Qfdb9p3Fi09V9uTOQpapUedtH96_SGG3rDbkd2D8iso0B4cmDUrJJfqH0RBJjtM_o"
      },
      %{
        name: "Proton Mail",
        package: "ch.protonmail.android",
        icon_url:
          "https://play-lh.googleusercontent.com/99IPL5W1HvN1TM7awcJ2gihUie-LQ5Ae7W9g0FgCBFJ8hNZnFIOJElyBPNcx4Wcx7A"
      },
      %{
        name: "Psych! Outwit Your Friends",
        package: "com.wb.goog.ellen.psych",
        icon_url:
          "https://play-lh.googleusercontent.com/BWi3ggyFdDWjas15aPNsxZk41jWlfVXH8bjPbunh4RToMjTCMMbg87AAwy_yRyl7pnU"
      },
      %{
        name: "Pubtran",
        package: "cz.fhejl.pubtran",
        icon_url:
          "https://play-lh.googleusercontent.com/jFDzLM9AXazCZ0-FlO2l8Z-KKPA5IMrP4DpAMdYH-6UQSIqtMtbryX4_zfKN-jEPOBo"
      },
      %{
        name: "PureGym",
        package: "com.innovatise.basefitch",
        icon_url:
          "https://play-lh.googleusercontent.com/xeG7MwdhwqOrTAumXe-3i44IwCwDXitS4M19qF9FolhNqB_xEMvoQRXkSfjJ2Ihk7T0"
      },
      %{
        name: "Qantas Airways",
        package: "au.com.qantas.qantas",
        icon_url:
          "https://play-lh.googleusercontent.com/lCyu99ytI8vWW3e_5u4ua79ypoJj8_v-WI0FJBSGO30gNPimYKdtuGcIDcZy1CaWG6RR"
      },
      %{
        name: "Qmanager",
        package: "com.qnap.qmanager",
        icon_url:
          "https://play-lh.googleusercontent.com/pBwzxelDACcsKv0hDFzp_jCHJhy41qHMKkL5U2GQQmP_dBKQAoOWdMXhYkB_HAUF0Q"
      },
      %{
        name: "Quizlet",
        package: "com.quizlet.quizletandroid",
        icon_url:
          "https://play-lh.googleusercontent.com/hiQHKRhpuGu4pWAFhpto9H7qWKSdX-BjKbDAtZYgm_jfoD0cN7MCllGOn6L3XWo-6Q"
      },
      %{
        name: "Quran for Android",
        package: "com.quran.labs.androidquran",
        icon_url:
          "https://play-lh.googleusercontent.com/zoyAL6BWpiHrgyFEujQcEXhBqZn4SfX0JiIFqOecs2JoZYy39Yam8xiz7Vq6kP7S2w"
      },
      %{
        name: "Qwant",
        package: "com.qwant.liberty",
        icon_url:
          "https://play-lh.googleusercontent.com/4OgeOW4AKFrOqvfxsClr7mwo7Er6b7DFbF1_fsQiEc5_CJzxgPo6chRUOCOZwJLowAc"
      },
      %{
        name: "RT News",
        package: "com.rt.mobile.english",
        icon_url:
          "https://play-lh.googleusercontent.com/14ac1J9m-vNPyPiQBue0GwQsujD8E6Iyach-A8KlMSYPPQ2-t7ueZ9QCGDoMoc7uEfE"
      },
      %{
        name: "RadiaCode",
        package: "com.almacode.radiacode",
        icon_url:
          "https://play-lh.googleusercontent.com/imI5hBHfMhvhKCyyz5eZmVbfZ_hC3Fs17e_kqHWPMxROpsfCnr7UeVXU0HqHEIkXCcRO"
      },
      %{
        name: "Radio Uno Oficial",
        package: "co.com.radiouno",
        icon_url:
          "https://play-lh.googleusercontent.com/mnsHko2kN5oDwyKhrDGvglKjqRLclNDkV3JH4gqapflh2oGOOMdfzl_od-_JnZ6AMg4"
      },
      %{
        name: "RaiPlay",
        package: "it.rainet",
        icon_url:
          "https://play-lh.googleusercontent.com/IFY5r5154bIN5y3m2DPq1_DuoMsKSjWmF43-gPX_XVM9Rv36Sb9YtycN8oJasnEUVdgJ"
      },
      %{
        name: "Railcard",
        package: "com.raildeliverygroup.railcard",
        icon_url:
          "https://play-lh.googleusercontent.com/uezdIOZfenh5NaOtFGyuB7vRnP9z98QzWlrYWCnsyqcqHd_bzRcrZJ-CgwQyFcVIWQ"
      },
      %{
        name: "Rat On A Scooter XL",
        package: "com.donutgames.ratonascooterxl",
        icon_url:
          "https://play-lh.googleusercontent.com/WUep6FxNc228IccKytApSfNcUzGBnW9SZjcbfoDCGurwVudG9tE1fhEZEkkpCx_Q5gnl"
      },
      %{
        name: "Real Racing 3",
        package: "com.ea.games.r3_row",
        icon_url:
          "https://play-lh.googleusercontent.com/Ni0S2Ltuia1l8n1aO1QF2MstwlNbGbDrApYlj-nFYZvkVKspUrKvUxGEirs1YKsuVmM"
      },
      %{
        name: "Rebel Racing",
        package: "com.hutchgames.rebelracing",
        icon_url:
          "https://play-lh.googleusercontent.com/qoF0of2etd7vmNTA2aeRNO6i25elwDpCVfrmx3pEXg2Wu2QnIAIutD37VGoe2HjMYRrW"
      },
      %{
        name: "Recycle!",
        package: "mobi.inthepocket.fostplus.recyclage",
        icon_url:
          "https://play-lh.googleusercontent.com/fgNKGs9fR39RaxG85y0K1eDVftXkZuWGAzhMTbJvzcZ8Sp7wimUFVUQaAAKW3hvDQYo-"
      },
      %{
        name: "Red Ball 4",
        package: "com.FDGEntertainment.redball4.gp",
        icon_url:
          "https://play-lh.googleusercontent.com/_2RsmTzfPHkBeSmDVOzgKaSQGLNqYep9mRsuYErzIcQslzAt_0hQDgoP4wJCwvMJkizT"
      },
      %{
        name: "Reddit",
        package: "com.reddit.frontpage",
        icon_url:
          "https://play-lh.googleusercontent.com/nlptFyxNsb8J0g8ZLux6016kunduV4jCxIrOJ7EEy-IobSN1RCDXAJ6DTGP81z7rr5Zq"
      },
      %{
        name: "Redfin",
        package: "com.redfin.android",
        icon_url:
          "https://play-lh.googleusercontent.com/tsZMrtvPdyrImpquQiUahy6V4sUAeAfTIxDBUOr4phkBct8e-uIGUjXtdjdW6CH-rg"
      },
      %{
        name: "Renpho",
        package: "com.qingniu.renpho",
        icon_url:
          "https://play-lh.googleusercontent.com/AXCm1HrLNhf6j0yTyRpr9XsPB4cMDK83wFF8sTql3JGylmwcTOep9Zs5WT_2ElmP2g"
      },
      %{
        name: "Resilio Sync",
        package: "com.resilio.sync",
        icon_url:
          "https://play-lh.googleusercontent.com/I0yxZ5kBUFyFQqBOVLq9lsoOpJSx8A3RZQjR024T8r8TsLD58gDjCkYWKSq_WWpOT-A"
      },
      %{
        name: "Revolut",
        package: "com.revolut.revolut",
        icon_url:
          "https://play-lh.googleusercontent.com/-M7DSN2fy0XKWVXgtrboFNR6ujPCPscnFo8De46IGrvFeQmxpHsCJstmx4ycSHjl1kaB"
      },
      %{
        name: "Ride SMART Flex",
        package: "smart.detroit",
        icon_url:
          "https://play-lh.googleusercontent.com/9GikW2RIeBPLALC795FqSHyWRwuUUS0uBE2c7gcyy1Kkq64o1njDHnHFYRuynvkIinc"
      },
      %{
        name: "Rightmove",
        package: "com.rightmove.android",
        icon_url:
          "https://play-lh.googleusercontent.com/mAiDwxeSjfdutkfE29TIIAGgCWvTMm0YvWZEwtoalyzoX-3tYXwBOSjMltac2DOZ1NU"
      },
      %{
        name: "Ring",
        package: "com.ringapp",
        icon_url:
          "https://play-lh.googleusercontent.com/fbIl2IKPAG4_3lNnwsi0qMBTJEgOsIwBUYzrs5_GIRYRBHov_a5eJ0bMxEUNMu67G4Ws"
      },
      %{
        name: "Roblox",
        package: "com.roblox.client",
        icon_url:
          "https://play-lh.googleusercontent.com/WNWZaxi9RdJKe2GQM3vqXIAkk69mnIl4Cc8EyZcir2SKlVOxeUv9tZGfNTmNaLC717Ht"
      },
      %{
        name: "Roborock",
        package: "com.roborock.smart",
        icon_url:
          "https://play-lh.googleusercontent.com/o72TwzLnS_iDlBCTRDhMFJmXU1hX3o5hhdXP8d52aniht76TmzNiMa_Mzh-VOVq6_As"
      },
      %{
        name: "Rocketbook",
        package: "com.rb.rocketbook",
        icon_url:
          "https://play-lh.googleusercontent.com/CzhkoXy-1P7wY7iyNHEFJwFieWVQfyHzeEouIumldBuc36WvBE6PU_M5KJ6B9zE_XrQf"
      },
      %{
        name: "Roon Remote",
        package: "com.roon.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/B8MrzgjsHiL_vsCbfWphVS-oPCf5l2ZIkvweq9KNFsFHjrP4pGpZ_YHYfIM-k6s5Kg"
      },
      %{
        name: "Ryanair",
        package: "com.ryanair.cheapflights",
        icon_url:
          "https://play-lh.googleusercontent.com/UlvFF-Zo2h6_8RdoMh9xWbAcaqSrsIU_yhQPOcH5rbTQ7Av9EvfWFTrAen1EX4X-JxA_"
      },
      %{
        name: "S-ID-Check",
        package: "com.entersekt.authapp.sparkasse",
        icon_url:
          "https://play-lh.googleusercontent.com/Lrvc_OgGhe2ShWwGcxfsGRkHf06Nb3XcSLpt2qmKRkGy9Hlnef53S4_U9KpzQN7JNuGZ"
      },
      %{
        name: "SBB Mobile",
        package: "ch.sbb.mobile.android.b2c",
        icon_url:
          "https://play-lh.googleusercontent.com/1NjTuQAyaT3G9UPG3VJ_PyZx34HE933tY68vcBWGktNeX2r3gycHubIE-PB_tX53-EM"
      },
      %{
        name: "SD Maid",
        package: "eu.thedarken.sdm",
        icon_url:
          "https://play-lh.googleusercontent.com/JSezGjSzK8Q0JiE9ZuPQMRGMWry6t1mwElamEg7yQs0FvMkHT-i9cKCpv7n-a-9oTw"
      },
      %{
        name: "SLFCU Mobile",
        package: "com.slfcu.slfcu",
        icon_url:
          "https://play-lh.googleusercontent.com/Nafr_L1zZubcOVakDtwiXeBo9TPk-p2LivtijYXWX_z45BYDXQ1UUyE7xuvlbHv0SPo"
      },
      %{
        name: "SNCB: Timetables & tickets",
        package: "be.sncbnmbs.b2cmobapp",
        icon_url:
          "https://play-lh.googleusercontent.com/gnC6K88KkqY4iwMiBqSho9YtF2h_rXLdQ5QE-GAA03hUCJD8phhl2J6fR1U1XKCkhDk"
      },
      %{
        name: "ST Best Buy",
        package: "bestbuy.shop.customer",
        icon_url:
          "https://play-lh.googleusercontent.com/ZCGY0iMepyGQnhvvyo_rwCnOp7lZlEo5hEdPAGs7_vody7W-YaXzxb7gjTR8YipECfLi"
      },
      %{
        name: "SafeNet MobilePASS+",
        package: "com.gemalto.mpassplus",
        icon_url:
          "https://play-lh.googleusercontent.com/FNlAvq6buG6qo3MColGWNoBRXMVGgtKAkjMR1PIWn5FOk_CtbPl9N1ec_z95syWUW0jf"
      },
      %{
        name: "Samsung Health",
        package: "com.sec.android.app.shealth",
        icon_url:
          "https://play-lh.googleusercontent.com/EoiTA0z1LdQHV2huvNc2NxXVquqAlOrwweONKMYjTYNYPK2KMQMOBR253NC6WsFm-dZl"
      },
      %{
        name: "Samsung Mobile Print",
        package: "com.sec.print.mobileprint",
        icon_url:
          "https://play-lh.googleusercontent.com/a90lDPbJUZdsxOyk0XGlj4fLfa1QW44RhSua0etP78IUkYHCnGny_rlY7hcRRHAOtA"
      },
      %{
        name: "Samsung Print Service Plugin",
        package: "com.sec.app.samsungprintservice",
        icon_url:
          "https://play-lh.googleusercontent.com/CdIos6mrIKCe3-wBkz0FOJnCuCkFWWzSeCotm1CEBAwgy-dUY0K6vHfE_VbCa-Sbaedg"
      },
      %{
        name: "Satispay",
        package: "com.satispay.customer",
        icon_url:
          "https://play-lh.googleusercontent.com/3kVsh_Xau12RonYU4Kz-vdZ1BRCLRs_mzmfrPPzf2ljdOHITYapo2EyKOwnlPzKZ0XQp"
      },
      %{
        name: "Sbanken",
        package: "no.skandiabanken",
        icon_url:
          "https://play-lh.googleusercontent.com/yj3GXpZC4tnixmtnll3f9m7sdPARJzgiMyXeRc1RCD0Uvr0JZ5gg-p5raNTFj9KGQRI"
      },
      %{
        name: "Schwab Mobile",
        package: "com.schwab.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/p8IZffRR9pvCvuzJenqngxh-VwJuC7Z5aJYXLj7p_5hbVtsnQ27RRdwJydw4GaegBW4X"
      },
      %{
        name: "Secure PDF Viewer",
        package: "app.grapheneos.pdfviewer.play",
        icon_url:
          "https://play-lh.googleusercontent.com/usgO9wPS2nSGEe01oglJ-cVtExfPSvIfjlX8L-gV-B9zWkhBoOoS3AiJLgc9KIETO6c"
      },
      %{
        name: "SecureW2 JoinNow",
        package: "com.securew2.paladin",
        icon_url:
          "https://play-lh.googleusercontent.com/30c0ilac6mmoHSPPKPztPb0534Ym5Nkmh15RNNlOOKIkZuaOTDuJ0nGvPUjB0jfqg48"
      },
      %{
        name: "Serenity: Guided Meditation",
        package: "uk.co.serenity.guided.meditation",
        icon_url:
          "https://play-lh.googleusercontent.com/ekiB-RiMpyr7QrdFWJD_mO61KNyLu3OvuXJ5lcWn3CDwo1Mu9i8T5nIyUqZvH5WUHHM"
      },
      %{
        name: "SeriesGuide",
        package: "com.battlelancer.seriesguide",
        icon_url:
          "https://play-lh.googleusercontent.com/Mi87VtZ2XTKGBA_t0610vYHbhkfnPnFmB8qDmWZa9DOkyf9uFVrt6kKVmil1xcZ6xw4"
      },
      %{
        name: "Service NSW",
        package: "au.gov.nsw.service",
        icon_url:
          "https://play-lh.googleusercontent.com/uulKLexOFnvrpg5ltH3jBAnCbMMed6VbaogVr9etutmFXO-P5w0JRa7sgJ1EstibjtI"
      },
      %{
        name: "Session",
        package: "network.loki.messenger",
        icon_url:
          "https://play-lh.googleusercontent.com/VDNa2MlVC3S5_8czrBSE01ilvmHTMS8NFJie6T9K4USUmnj5ETrf4pngGBPo8dZ3qYw"
      },
      %{
        name: "Sharedr",
        package: "com.rejh.sharedr",
        icon_url:
          "https://play-lh.googleusercontent.com/pndrRd5nGnwAsDQXfrwiI1hmrH_aeAPERmUT8bjtP5ZonOY7Fs5Htp118U06bYtiAg"
      },
      %{
        name: "Shareworks",
        package: "com.solium.shareworks",
        icon_url:
          "https://play-lh.googleusercontent.com/vqSOLz9-EVLhxf3jo6Fa1VZtFeWiTvhYx8yj-ttTOOyCXVRN-QLLHK9JlUGmKL2p-g"
      },
      %{
        name: "Shazam",
        package: "com.shazam.android",
        icon_url:
          "https://play-lh.googleusercontent.com/mwTU9-4NX-_QlATb6lILSinKI47wAtOM38GjPYRPQSsQOG2hVRY4h9OfEhDxpf8ADQ"
      },
      %{
        name: "Signal",
        package: "org.thoughtcrime.securesms",
        icon_url:
          "https://play-lh.googleusercontent.com/jCln_XT8Ruzp7loH1S6yM-ZzzpLP1kZ3CCdXVEo0tP2w5HNtWQds6lo6aLxLIjiW_X8"
      },
      %{
        name: "Simple habit: meditation, sleep",
        package: "com.simplehabit.simplehabitapp",
        icon_url:
          "https://play-lh.googleusercontent.com/RANHZnUT7KSTfyd8LxLjXB3uDtdqnPUPisjDpejCatYbEBVimQHhfxQWUdCr_cxHomo"
      },
      %{
        name: "Simplisafe Home Security App",
        package: "com.simplisafe.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/tKzMqJnk5EfhUNMOTzrVs7nkmVUOU5hxOyHhuLqPNkqABwe9ustZC0q5LlOLEPWI7Q"
      },
      %{
        name: "Simply Wall St",
        package: "com.simplywallst.app",
        icon_url:
          "https://play-lh.googleusercontent.com/2yRELZhVpGmtLqhneW9hbMxzCspeVgyvoNeM3aZLelr4warNY5LfPwKce6NAiIiEx4Ak"
      },
      %{
        name: "SketchBook",
        package: "com.adsk.sketchbook",
        icon_url:
          "https://play-lh.googleusercontent.com/NIhaPLVMl69snWk7IOWADeBwU-8FG5VL1q41_fmd6TVa4FEIqXQw3Ar3BovrXvza2Q"
      },
      %{
        name: "Sky Map",
        package: "com.google.android.stardroid",
        icon_url:
          "https://f-droid.org/repo/com.google.android.stardroid/en-US/icon_viguh3xj7mYysCwo-kWNIl5Hv8iMQV81ma2soxFM8BY=.png"
      },
      %{
        name: "Skype",
        package: "com.skype.raider",
        icon_url:
          "https://play-lh.googleusercontent.com/-Udh2Qv4FyhP2uLfvNy27jzzXrrIfnDEi9kUqzhy8OQgGUcWXXud6nlg8UywECiRmME"
      },
      %{
        name: "Slack",
        package: "com.Slack",
        icon_url:
          "https://play-lh.googleusercontent.com/mzJpTCsTW_FuR6YqOPaLHrSEVCSJuXzCljdxnCKhVZMcu6EESZBQTCHxMh8slVtnKqo"
      },
      %{
        name: "Slay the Spire",
        package: "com.humble.SlayTheSpire",
        icon_url:
          "https://play-lh.googleusercontent.com/ryhmN3MoDNXB_lsX85BaAk-N8errnNbS_KIYex1wgeBEfUzoYKFXQ1_ane9ASV19NOI"
      },
      %{
        name: "Sleep as Android",
        package: "com.urbandroid.sleep",
        icon_url:
          "https://play-lh.googleusercontent.com/8T390CJk1L29Cq3POAzSCHhxYg7AqUCKam8xSHc-sEtIL5RQNVv77ZzKFbMU3pXFFA4"
      },
      %{
        name: "Smart-ID",
        package: "com.smart_id",
        icon_url:
          "https://play-lh.googleusercontent.com/HDVfrTvYiJnoWZcw4xvP-V6DpF2psJFjfEzRZ8QANA9GhA1r1BoL0hTbWoThzTYmgB8"
      },
      %{
        name: "SmartNews",
        package: "jp.gocro.smartnews.android",
        icon_url:
          "https://play-lh.googleusercontent.com/JgxjX_zgsfKX0jqShm5njq1XC3rkXgl5-LCprgli4uuLc_w5skyYU-4ZI0My9W5n"
      },
      %{
        name: "SmartThings",
        package: "com.samsung.android.oneconnect",
        icon_url:
          "https://play-lh.googleusercontent.com/zbO2ggF6K2YVII3qOfr0Knj3P0H7OdtTjZAcGBo3kK0vJppGoYsG4TMZINqyPlLa9vI"
      },
      %{
        name: "Smash Hit",
        package: "com.mediocre.smashhit",
        icon_url:
          "https://play-lh.googleusercontent.com/Fjkmw0dBQ47oRI89hn8-rdkqpM4oKJ5_ht5tmye99msvCMd-Xz25fs5zQCiqJoINIZg"
      },
      %{
        name: "Snapchat",
        package: "com.snapchat.android",
        icon_url:
          "https://play-lh.googleusercontent.com/KxeSAjPTKliCErbivNiXrd6cTwfbqUJcbSRPe_IBVK_YmwckfMRS1VIHz-5cgT09yMo"
      },
      %{
        name: "Snapseed",
        package: "com.niksoftware.snapseed",
        icon_url:
          "https://play-lh.googleusercontent.com/Rilq4obCk7XIl2Pjb8XT-Ydh_aI3hBNeFwro9fFXrIAuC-zPxCZ4feE4rx5fZ3jHNLw"
      },
      %{
        name: "SoloLearn",
        package: "com.sololearn",
        icon_url:
          "https://play-lh.googleusercontent.com/LIGo0qeu7aTc3LFnyDRTV01Q6szr3iG3h2WSqYj7Ef1XFKAS6IvKKuLSpTJn7NJUj-U"
      },
      %{
        name: "Somfy Protect",
        package: "com.myfox.android.mss",
        icon_url:
          "https://play-lh.googleusercontent.com/z_31tTpaEzQ9iQqH843vRVHnHioG6LOpCn_9fNEPLhy4aN_PbjD_-VqYAMFaRNTqLw"
      },
      %{
        name: "Songsterr Guitar Tabs & Chords",
        package: "com.songsterr",
        icon_url:
          "https://play-lh.googleusercontent.com/RTCkT5PYhBu3AU7w5vAp5C-2DR0kUK62vP4zwsOaFqxq5Da2L69xyP81Mo5gPvPzVZM"
      },
      %{
        name: "Sonic Dash",
        package: "com.sega.sonicdash",
        icon_url:
          "https://play-lh.googleusercontent.com/4F-WwVKAs56rT6DGSfu1-9sW4MqSjenlIUqWS1K_8iB25ktsHKXXScAwJonvwo7DuMA"
      },
      %{
        name: "Sonos",
        package: "com.sonos.acr2",
        icon_url:
          "https://play-lh.googleusercontent.com/ixBnWaJs0NdWI1w4rpAgiWlavHQZ2cMpatPoh3dwbj6ywnYIZ0g6me16prz-ABr7GA"
      },
      %{
        name: "Sony | Headphones Connect",
        package: "com.sony.songpal.mdr",
        icon_url:
          "https://play-lh.googleusercontent.com/BpJMwIjqHja-cZL_p2JREBTuG8d-Nyp9gUiQzciP9HvHAsF69mt9HFzouFTdimiuiWIH"
      },
      %{
        name: "Sony | Music Center",
        package: "com.sony.songpal",
        icon_url:
          "https://play-lh.googleusercontent.com/NX1W7v7MLu2vdC2bISLZz_SkVLNcI0N9dIGQdlOqF_uEVM4J1RZjhWMHoisiUY4-EzY"
      },
      %{
        name: "SoundCloud",
        package: "com.soundcloud.android",
        icon_url:
          "https://play-lh.googleusercontent.com/lvYCdrPNFU0Ar_lXln3JShoE-NaYF_V-DNlp4eLRZhUVkj00wAseSIm-60OoCKznpw"
      },
      %{
        name: "Southwest Airlines",
        package: "com.southwestairlines.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/vrjZfz_lztdUB8Aai-hyM7esx1Ru9Jm5pPsvtuHxTub64v4ekRe8RxqnuXhTdiO6vXs"
      },
      %{
        name: "Spark - Email App",
        package: "com.readdle.spark",
        icon_url:
          "https://play-lh.googleusercontent.com/y7ObD38ZOG58hT_2SEaCUmlx2QDMcRVx6h62JEJ-oV89ID3PcHIP_tLNR0D7_c1aUONc"
      },
      %{
        name: "Spotify",
        package: "com.spotify.music",
        icon_url:
          "https://play-lh.googleusercontent.com/P2VMEenhpIsubG2oWbvuLGrs0GyyzLiDosGTg8bi8htRXg9Uf0eUtHiUjC28p1jgHzo"
      },
      %{
        name: "Spotistats for Spotify",
        package: "dev.netlob.spotistats",
        icon_url:
          "https://play-lh.googleusercontent.com/OO06tTnQyEckM3dUDbHqmWXpI-7IbYlodDxVR7L4buzOX6KQvAeTJEV_Q45cznM63mJ-"
      },
      %{
        name: "Sputnik News",
        package: "com.sputniknews.sputnik",
        icon_url:
          "https://play-lh.googleusercontent.com/HPsP9lLYKYoiEx6IbQim8iJwGNabvp33Mn3OTE6yer6QuSdDbHA2dzcizpjNpAysdEU"
      },
      %{
        name: "StadtRAD Hamburg",
        package: "de.stadtrad.hamburg",
        icon_url:
          "https://play-lh.googleusercontent.com/FF5B1IKIhSdtln77kjJ8-TPvvH0IrurF65d1aRwdVXaASQpNhg5tJWKUaDLD3m15d50"
      },
      %{
        name: "Stick War: Legacy",
        package: "com.maxgames.stickwarlegacy",
        icon_url:
          "https://play-lh.googleusercontent.com/sITxnGaUxYVzTDkVAjRSKM8JKehWTuseE4hF8937sWVattKHEAirl7uZw93gqad_fQg6"
      },
      %{
        name: "Strava",
        package: "com.strava",
        icon_url:
          "https://play-lh.googleusercontent.com/j-ZV144PlVuTVsLuBzIKyEw9CbFnmWw9ku2NJ1ef0gZJh-iiIN1nrNPmAtvgAteyDqU"
      },
      %{
        name: "Stryd",
        package: "com.stryd.pioneer",
        icon_url:
          "https://play-lh.googleusercontent.com/MQyy_B5itOrHHi1p6lcy6YwbEWk8-8BS48YfM6bbIIzZRocl6ihXq5hDZA0NJl7Vzg"
      },
      %{
        name: "Subway Surfers",
        package: "com.kiloo.subwaysurf",
        icon_url:
          "https://play-lh.googleusercontent.com/x2J14UGc9pQnjXzCocCYJWzHSHkUwvfmilC4aUHNi4Vb5yPpspQKU3WZyUHNOlUAZTw"
      },
      %{
        name: "Subway Tooter",
        package: "jp.juggler.subwaytooter",
        icon_url:
          "https://play-lh.googleusercontent.com/iDLGypRZ3zW-7HBm6ZDiq33G8RBGldDiYFm2tMnThqwCuOqn35zOm9agdR_x67YP_uw"
      },
      %{
        name: "Success Coach",
        package: "com.way4app.successwizard",
        icon_url:
          "https://play-lh.googleusercontent.com/ouvNWr36VLYiRtM1uJorxqDxXojLLTcpy4zbt7VbkcMUN2Xf6okhhh6T0mMLaWA1zFI"
      },
      %{
        name: "SuedtirolMobil",
        package: "it.bz.provincia.altoadigetogo.android",
        icon_url:
          "https://play-lh.googleusercontent.com/w0_eu57cxLevi3mtgBXLGRlvExrKtgUBxXMrOhZsVT3Ar4-eX4SpumlICtPFqKNcoQc"
      },
      %{
        name: "Super Hexagon",
        package: "com.distractionware.superhexagon",
        icon_url:
          "https://play-lh.googleusercontent.com/UNlrA6CZ_ZGvyE7ZsQeAkCSrlcMan8aqV4ijlGNJO5oyHf_rjY_aK3ED3wOn7QbRewE"
      },
      %{
        name: "Super Mario Run",
        package: "com.nintendo.zara",
        icon_url:
          "https://play-lh.googleusercontent.com/5LIMaa7WTNy34bzdFhBETa2MRj7mFJZWb8gCn_uyxQkUvFx_uOFCeQjcK16c6WpBA3E"
      },
      %{
        name: "Super Wallet Mexico",
        package: "mx.com.santander.superwallet",
        icon_url:
          "https://play-lh.googleusercontent.com/3gqD_rKqKfiyLhmhW5Il4UvMpqcfJWrIKLRNFo_Di6lw8pM-sEW-LfR1GyV7EMLodc6h"
      },
      %{
        name: "SuperMovil",
        package: "mx.bancosantander.supermovil",
        icon_url:
          "https://play-lh.googleusercontent.com/JlEjMqsRHfbh4zZtMI-b4Np5kSCvh3H7Tiwf4GSUYUPhZ1_LIAwIXomMamKjefYNLp4"
      },
      %{
        name: "Surfshark",
        package: "com.surfshark.vpnclient.android",
        icon_url:
          "https://play-lh.googleusercontent.com/4hhHibroqWrEj4x0458ubKG0sD6wBAZEqvFxyOcjHGELyAE58H6Dri8s3xYbVt6BQSUC"
      },
      %{
        name: "Swedbank Lietuva",
        package: "lt.swedbank.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/PvYtINGosf1HrUEIwg34NSIJgoQwFQoOR4AKgBEAO_EdfYwXQNc4MRYdXJNnK8YPwA"
      },
      %{
        name: "Swiggy",
        package: "in.swiggy.android",
        icon_url:
          "https://play-lh.googleusercontent.com/A8jF58KO1y2uHPBUaaHbs9zSvPHoS1FrMdrg8jooV9ftDidkOhnKNWacfPhjKae1IA"
      },
      %{
        name: "Swisscard",
        package: "com.swisscard.prod",
        icon_url:
          "https://play-lh.googleusercontent.com/B1amjRJz5SCmOBNmNsvlRDgSJA4KBGLbA8Ao3b_SZ6IFXoRti-yIYdhithHp3RFQC4k"
      },
      %{
        name: "Swisstopo",
        package: "ch.admin.swisstopo",
        icon_url:
          "https://play-lh.googleusercontent.com/QccNMDpVuIgS705fJE24A2EqN3ZEIWS8ZMlcV8NhQ3UQnw8deQh2oAo_S102fSvEWg"
      },
      %{
        name: "Sygic GPS Navigation & Maps",
        package: "com.sygic.aura",
        icon_url:
          "https://play-lh.googleusercontent.com/7C0WIhhdtfzwpBuOft_8lkXoEGsPgH__MbCyNdFX7Wow-CNdKX0WxZzxSv7Mi1PHMg"
      },
      %{
        name: "Sync for reddit",
        package: "com.laurencedawson.reddit_sync",
        icon_url:
          "https://play-lh.googleusercontent.com/rneSvN2UXjglI5q6Cl7Hiim84n5bIUBghhSZNfDQk7Zjw8gWCWgxA5zW_c2i-TNYfEbv"
      },
      %{
        name: "Synology DS Cam",
        package: "com.synology.DScam",
        icon_url:
          "https://play-lh.googleusercontent.com/GKLlFTdsQVvvMye23sHXTpE1TZYtr0KLzsL3iJ0NwuIc2gz1i5-n_PLQD0OqhvMd8w"
      },
      %{
        name: "Synology Drive",
        package: "com.synology.dsdrive",
        icon_url:
          "https://play-lh.googleusercontent.com/DOhj0GDYlhVFlmmxWvQBL--KXNYs2EcDloCoEIcuckKcBUYbLbDq-op-B4n-C8B6JuQ"
      },
      %{
        name: "Synology Moments",
        package: "com.synology.moments",
        icon_url:
          "https://play-lh.googleusercontent.com/kyuh8WKDxRDDAscdNpLDmCu0d9G2TDVusotvPXQhBH2h8G1aKXTSGAazaX4Yz2rM1w"
      },
      %{
        name: "TED",
        package: "com.ted.android",
        icon_url:
          "https://play-lh.googleusercontent.com/rcI6L8JBagw27bBiS-sjTAxdurhdf-bWLcTQVH6gjYHym3Nf0VOhyzOdzaEYM9NTBXxk"
      },
      %{
        name: "THINKWARE CLOUD",
        package: "com.thinkwaresys.thinkwarecloud",
        icon_url:
          "https://play-lh.googleusercontent.com/GhyXehoB2sGskqU66d6fje6y2Z5Nvp8aaXMFeq7z4UeHfsVCWplffMbqhjrd7hU5s64"
      },
      %{
        name: "TP-Link Deco",
        package: "com.tplink.tpm5",
        icon_url:
          "https://play-lh.googleusercontent.com/wJ0hbmXNGvRgPIldpf0vbhs9EbcpyJwnMrB2l0jMqp9jSjVmi7qJXgigjQNRUpqsD00"
      },
      %{
        name: "Taffic Rider",
        package: "com.skgames.trafficrider",
        icon_url:
          "https://play-lh.googleusercontent.com/590AflDt-hW2t85Cit_ODJPJdRiMMRn2cSF0vYNfsBpjm895x1zDy0npbD7IlDCvmNvI"
      },
      %{
        name: "Tagesschau",
        package: "de.tagesschau",
        icon_url:
          "https://play-lh.googleusercontent.com/OpxVwzcusPYywi99J47aq112s2n8f_fw_4EXUFOXlNBV0pUYSmH7d4qOh8Vt_A6wlCG1"
      },
      %{
        name: "Tanger Outlets",
        package: "com.mvl.tanger",
        icon_url:
          "https://play-lh.googleusercontent.com/qi8HkQuGTChbgEu_MdrJqMN1D-WyNBkPpP7SvkbUIv9fXjZxyJ2ilaeqmEL-PmnOEWE"
      },
      %{
        name: "Tangerine Mobile Banking",
        package: "ca.tangerine.clients.banking.app",
        icon_url:
          "https://play-lh.googleusercontent.com/zCfgwBHlRzoFa2ojWM99apfc3xlCstaz5Uyo4kTFEV5Qw4tB1D7Ohp7rw9C-wngKVzA"
      },
      %{
        name: "Tap Tap Dash",
        package: "com.secondarm.taptapdash",
        icon_url:
          "https://play-lh.googleusercontent.com/XgHTdJDAVhCxxUOG6v8L0zfJD1_Pf3BjVfXBjmh4qpKIc-jcjvx4LxKUhn2X689ivzI"
      },
      %{
        name: "Tap Titans 2",
        package: "com.gamehivecorp.taptitans2",
        icon_url:
          "https://play-lh.googleusercontent.com/r3K7M5cypCMq00W8a4ENHKhqoCToBlrvaUiklANpOIDaLB7x9B59EFZvemDquzHXRcc"
      },
      %{
        name: "Tapatalk",
        package: "com.quoord.tapatalkpro.activity",
        icon_url:
          "https://play-lh.googleusercontent.com/Rj-xXVWUsnq3TPxIxiUnsQ9SPW2REg2VI60bopvTPGzc67nQiVkvT5lpdfi_lkWNCw"
      },
      %{
        name: "Tautulli Remote",
        package: "com.tautulli.tautulli_remote",
        icon_url:
          "https://play-lh.googleusercontent.com/LHmPG8shnappsJbzM1ItaR_ZqNx6EMGJbGAeGu4Id7JQgYXs8iQJSURwDXSbvyaMdGLB"
      },
      %{
        name: "TeamViewer QuickSupport",
        package: "com.teamviewer.quicksupport.market",
        icon_url:
          "https://play-lh.googleusercontent.com/8nwT1oyitY4nAh1zasfOCJzgsN-svQus2KDXhHGhMJrVarAdSu1AGPAyGULjb57ASJg"
      },
      %{
        name: "TeamViewer Universal Add-On",
        package: "com.teamviewer.quicksupport.addon.universal",
        icon_url:
          "https://play-lh.googleusercontent.com/G04R8KXiB4-jjFDlq1jLcSRp2TGRIo7q8V7cZJsxLUw-HUUU6EuLYuaG2MSvFUcgahE"
      },
      %{
        name: "Teamapp",
        package: "com.baaarteeek.team_app",
        icon_url:
          "https://play-lh.googleusercontent.com/BHYxRN3fQaXlL107TCBCadT2IvOxH9I3qFOJLCz_xpboETH8NXKI0X1QmekiBs7JCw"
      },
      %{
        name: "Teamspeak 3",
        package: "com.teamspeak.ts3client",
        icon_url:
          "https://play-lh.googleusercontent.com/2JqzHM185sArb5To_1vpaTo3rvmIotOW7OPmSMNW6eYJMQAK9NrHbJi4FLs5YaoeMuQ"
      },
      %{
        name: "Telegram",
        package: "org.telegram.messenger",
        icon_url:
          "https://f-droid.org/repo/org.telegram.messenger/en-US/icon_yf3k2arrpvOWv5oUZ3p1Eri1ThBaYEhH0lEWqjiyFO4=.png"
      },
      %{
        name: "Telegram X",
        package: "org.thunderdog.challegram",
        icon_url:
          "https://play-lh.googleusercontent.com/Zmol9WVk6mjWE38P6wc3Aaz9mQn-VFhviKllLP4kiplfW4xIEjgYmKUalZcFsOOnDQ"
      },
      %{
        name: "Telepass",
        package: "uk.co.novaware.telepass.android",
        icon_url:
          "https://play-lh.googleusercontent.com/RS-1gqeVUFBHwo4hvVP_r8QnowMqXTiKWB_81kWqSF3geTkIUBap-_WojurByq0sqDo"
      },
      %{
        name: "Tello",
        package: "com.ryzerobotics.tello",
        icon_url:
          "https://play-lh.googleusercontent.com/H-ryQ32tUHqNMqh_aN-zHNtN0giApTE0InoWI1t5gnLdHWlK-eA6uuRa4GJsl8fEN-Y"
      },
      %{
        name: "Temple Run",
        package: "com.imangi.templerun",
        icon_url:
          "https://play-lh.googleusercontent.com/onlNBInQHIZtB2rY24BwrEsUUKwE753ao1BAvvhOw2ePEN1IHIUjaR3gvlGd3jyKTdg"
      },
      %{
        name: "Temple Run 2",
        package: "com.imangi.templerun2",
        icon_url:
          "https://play-lh.googleusercontent.com/go4XqS4mYs-G2tZymiVLF4wJYXIi5QrvwixNRzssk4G_vRBHrAdg4E1ddNwy9c2cZA"
      },
      %{
        name: "The Guardian",
        package: "com.guardian",
        icon_url:
          "https://play-lh.googleusercontent.com/0IoGNBJeaga47hJgxtTzXXlPQmZYGjrzghS1NLoCrtjJTkm_GSRs5e44FmrXxxCUYJs"
      },
      %{
        name: "The New York Times",
        package: "com.nytimes.android",
        icon_url:
          "https://play-lh.googleusercontent.com/gfmioo4VBEtPucdVNIYAyaqruXFRWDCc0nsBLORfOS0_s9r5r00Bn_IpjhCumkEusg"
      },
      %{
        name: "The Wall Street Journal",
        package: "wsj.reader_sp",
        icon_url:
          "https://play-lh.googleusercontent.com/eksxaPfxbTVb6VTl5aj1sXLpKc_N9Z6AZ3_5Oq6JhTXmgEQza-1v58a66p_ID0phE2Zv"
      },
      %{
        name: "The Wolf's Stash",
        package: "se.zepiwolf.tws.play",
        icon_url:
          "https://play-lh.googleusercontent.com/fMesWl45Gv00701-AhvjtDC7LdwVDmDp1YMJiwGV5X4pIlcW5aOjRAQEunsoxwwzf7U"
      },
      %{
        name: "Threema",
        package: "ch.threema.app",
        icon_url:
          "https://play-lh.googleusercontent.com/T541F_8Sykot61SdVoioOB0xk1obSY4ZtTDALTuVJVpfCgYjS2TAG1RG9e6A1forEg"
      },
      %{
        name: "Thuisbezorgd.nl",
        package: "com.takeaway.android",
        icon_url:
          "https://play-lh.googleusercontent.com/-hFgU3ckd7geA5X0Sb6-nqtFO41NnWE0q-GN2vyWxVj_YJBsMZRf0NeHruKrRFiV4dzM"
      },
      %{
        name: "TickTick",
        package: "com.ticktick.task",
        icon_url:
          "https://play-lh.googleusercontent.com/JkYolPNuRAlrXEI9vlk-XOid3VFJ0IPjDj2eM_xrriuE3Zu8IX9cuMkI7JOTw1upNxbW"
      },
      %{
        name: "Tidal",
        package: "com.aspiro.tidal",
        icon_url:
          "https://play-lh.googleusercontent.com/TusOKTn4sDTPYBgf8uGVPrkQqElbyvRi_fD8shKEhCeSw-HZfbtbX2c4VfgB0nzeTA"
      },
      %{
        name: "TikTok",
        package: "com.zhiliaoapp.musically",
        icon_url:
          "https://play-lh.googleusercontent.com/OS-MhSWOPtlUZLt0_UP5TI4juSf0XhyHxGfJa6pA-UIYkZ1BB6QHTZwaMEzZDPqYsmk"
      },
      %{
        name: "Tile",
        package: "com.thetileapp.tile",
        icon_url:
          "https://play-lh.googleusercontent.com/w6EgIWBVEk7loNitXVOt9H8GCr5teIkjEXNAnvD53l_UbeK4fxW09gSi-1gdX5vsQ3tB"
      },
      %{
        name: "Tiles Hop",
        package: "com.amanotes.beathopper",
        icon_url:
          "https://play-lh.googleusercontent.com/uA2SPkUUN4feau4S-JtJrxjTfjQ7s5_9vTA2dj1ECSPQy_GrQXGzSp_PH0eTibmymsM"
      },
      %{
        name: "Tinder",
        package: "com.tinder",
        icon_url:
          "https://play-lh.googleusercontent.com/fDpoqIbZ884ylRnMK8Lx9Fu4DsLQk5yt4f9WkxeOAPpGnzc9BTi_YKkMsLvoMdx7Uzg"
      },
      %{
        name: "Todoist",
        package: "com.todoist",
        icon_url:
          "https://play-lh.googleusercontent.com/GK0SwEBVqlFBpRkPjY6y_1go6E6xZzAN0Ivzfgbuf28J4TTOoOsgWnqR4oJ_RhIhsg"
      },
      %{
        name: "Tomorrow Mobile Banking",
        package: "one.tomorrow.app",
        icon_url:
          "https://play-lh.googleusercontent.com/SqWSo_zNi0FnV1CELDO7f7HI_Cu85kksuvut_tgMNmvv1G9QRrvBWoxsTSYzxCf8uw"
      },
      %{
        name: "Total Launcher",
        package: "com.ss.launcher2",
        icon_url:
          "https://play-lh.googleusercontent.com/asjOZy7DFxc4GNT1UsUuixihFxQjWl9vBoYOBWwvglwI-mTO_fkQBJLl_vhe5A9BhJQ"
      },
      %{
        name: "TousAntiCovid",
        package: "fr.gouv.android.stopcovid",
        icon_url:
          "https://play-lh.googleusercontent.com/HjlF5_gYtZmJVc2jbVBksjUHy-Q4-0UiO8InPswlsncZhBZmnfQVsmv7jUvv8Nw5WA"
      },
      %{
        name: "Trade Republic",
        package: "de.traderepublic.app",
        icon_url:
          "https://play-lh.googleusercontent.com/pHXtOQQ__TBgp_c9FgfBOCp4cXL9oU5tVAe318JDvcQP266UCO7U_VyO6lUzo8ZWPWJ_"
      },
      %{
        name: "TradingView",
        package: "com.tradingview.tradingviewapp",
        icon_url:
          "https://play-lh.googleusercontent.com/Mz83heom_8jnRplnSDxZFJ3WMz7EpMARiMZPkKTHpWF2HAh9DZTJFphjLTSWxfTa_g"
      },
      %{
        name: "Traffic Racer",
        package: "com.skgames.trafficracer",
        icon_url:
          "https://play-lh.googleusercontent.com/2uTOewaztiOuJsDPyMXSlBkeQq2sM5netXJUpi2Nk_e06XU9cqIfaK6l02vRYkumsQI"
      },
      %{
        name: "Trainline",
        package: "com.thetrainline",
        icon_url:
          "https://play-lh.googleusercontent.com/01DZthgdocCF5tYXt3MxpV_zTxXV1CST6U9Fbsr9SXygqw7dD42YjlZMAxUO6N4-VZI"
      },
      %{
        name: "Transmission Remote",
        package: "net.yupol.transmissionremote.app",
        icon_url:
          "https://play-lh.googleusercontent.com/XSaoes_LJBT7wBeupHvMlr8yu4Fh2p-T7ksVrwlzhkYsmr3jpgLoAGj48u0Zq_E0tA"
      },
      %{
        name: "Trello",
        package: "com.trello",
        icon_url:
          "https://play-lh.googleusercontent.com/CiGs15N1e1tXrSnVLEY9jOnKi1oNzPQNRjqhR8fXE0pnu_bRyNmfc8xXr2VQUJTfJ9A"
      },
      %{
        name: "Tresorit",
        package: "com.tresorit.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/CgTTWgyZqIpNqVo3nm-Xr1rx78uFmy2k3L7q-DXjikYU1KP2yqZjCGJpbLV7vVhacuw"
      },
      %{
        name: "Tricount",
        package: "com.tribab.tricount.android",
        icon_url:
          "https://play-lh.googleusercontent.com/2T_FKtCneoJlz9GJD2XiEKHnLyeuwa46_7iu3fTIETpxCMUmj451xthIQxQkR703nqg"
      },
      %{
        name: "TripIt",
        package: "com.tripit",
        icon_url:
          "https://play-lh.googleusercontent.com/Q5MO1O16dA5Bg22LIcNsmeyJYT8smqyRblAnUbJ7fJOCZsYrea_2khF0_XZvBo4f6NM"
      },
      %{
        name: "Tripadvisor",
        package: "com.tripadvisor.tripadvisor",
        icon_url:
          "https://play-lh.googleusercontent.com/SOHKWI6RznrRqWVUSb6THa2bJNQPvjOTLsd4CSad_GCahf2fe2p4vE8FOKjtuudmL6E"
      },
      %{
        name: "Truecaller",
        package: "com.truecaller",
        icon_url:
          "https://play-lh.googleusercontent.com/nn_U3vONiACS6blzpxXPhIDRDsyE97cozJj0bXfgxCUFStnEhZ28r2F1Lm5Z8PAfZqM"
      },
      %{
        name: "TuneIn Radio",
        package: "tunein.player",
        icon_url:
          "https://play-lh.googleusercontent.com/KLI43egHmMQhCvDTH-EDWDdtxxPODJk6YO56Fa5cmmiYRd5LfBAXrVZmHcRCQ5j9_rZD"
      },
      %{
        name: "Tuner - Pitched!",
        package: "com.stonekick.tuner",
        icon_url:
          "https://play-lh.googleusercontent.com/0tRvzxNmkfoVKZsJ9pMBn92m7BNWK8VFqINecxIiPnrvossMonAoBvwoGyvgMFbYjA"
      },
      %{
        name: "Twitch",
        package: "tv.twitch.android.app",
        icon_url:
          "https://play-lh.googleusercontent.com/QLQzL-MXtxKEDlbhrQCDw-REiDsA9glUH4m16syfar_KVLRXlzOhN7tmAceiPerv4Jg"
      },
      %{
        name: "Twitter",
        package: "com.twitter.android",
        icon_url:
          "https://play-lh.googleusercontent.com/wIf3HtczQDjHzHuu7vezhqNs0zXAG85F7VmP7nhsTxO3OHegrVXlqIh_DWBYi86FTIGk"
      },
      %{
        name: "TypeApp mail",
        package: "com.trtf.blue",
        icon_url:
          "https://play-lh.googleusercontent.com/NYuybHEQh1FKtH7yjbXabuWKybHSF8aTb7STbSMO6KnrX8FqvnGsF-evjD0ELMk0Nzs"
      },
      %{
        name: "UPS Mobile",
        package: "com.ups.mobile.android",
        icon_url:
          "https://play-lh.googleusercontent.com/U9Si6TtVOfa-3nYvT9BubYlUhq0OT_3YF5MK2LuGyOFKsNliiEl8eihc5sry_-LyDdg7"
      },
      %{
        name: "USAA Mobile",
        package: "com.usaa.mobile.android.usaa",
        icon_url:
          "https://play-lh.googleusercontent.com/Py8dC53FslHcvrzbtfWmf33oj-BVNFve5ziyEwy2SsmlXxlCFdp49efQQ3aqoMy4DoA5"
      },
      %{
        name: "Uber",
        package: "com.ubercab",
        icon_url:
          "https://play-lh.googleusercontent.com/AQtSF5Sl18yp3mQ2tcbOrBLekb7cyP3kyg5BB1uUuc55zfcnbkCDLHFTBwZfYiu1aDI"
      },
      %{
        name: "Uber Eats",
        package: "com.ubercab.eats",
        icon_url:
          "https://play-lh.googleusercontent.com/kDzXydb6ZT4LUj0RiU-GyptnVgCzzk9snN1FVxj2YfqFb4PpRdQRBKzdz4jzUOxAS9-d"
      },
      %{
        name: "Udemy",
        package: "com.udemy.android",
        icon_url:
          "https://play-lh.googleusercontent.com/dsCkmJE2Fa8IjyXERAcwc5YeQ8_NvbZ4_OI8LgqyjILpXUfS5YhEcnAMajKPrZI-og"
      },
      %{
        name: "Unacademy Learning App",
        package: "com.unacademyapp",
        icon_url:
          "https://play-lh.googleusercontent.com/DT0jm91vA_rOkxwatXhI4yVpjU4KI0augje6ZJGYxEyNjKvIhcQt8npiLHf5-ydclsqe"
      },
      %{
        name: "UniFi Network",
        package: "com.ubnt.easyunifi",
        icon_url:
          "https://play-lh.googleusercontent.com/femOifnBg1-dlh2_rpEAzQzIuTXqFHtvNLIsmHOR7VvgtqLfOEHoz8eZS7w5H8TqqMdQ"
      },
      %{
        name: "Universal Remote Control - Learn Remote",
        package: "co.leanremote.universalremotecontrol.remotecontrol",
        icon_url:
          "https://play-lh.googleusercontent.com/WDStKJxD5ryi69EJRbUACaDLBwESG8825HbETxG5tp6G39dOMY54Yr4jvkKWc4fyr8VW"
      },
      %{
        name: "University of Innsbruck",
        package: "at.ac.uibk.app",
        icon_url:
          "https://play-lh.googleusercontent.com/QX3HPgDgwFGl66VXAoR4I5Ll2RFEVsiaRwWXU6R-m4v47KCmMdKpGFpVpvvRAPZwSw"
      },
      %{
        name: "Untappd",
        package: "com.untappdllc.app",
        icon_url:
          "https://play-lh.googleusercontent.com/e1f4pqu_nn0p6MgMI0YW3vBWy9GLlim_8ln_9xe1fLcq91Xi8X7r9BeqDy5kMoKDuTM"
      },
      %{
        name: "Urban Outfitters",
        package: "com.urbanoutfitters.android",
        icon_url:
          "https://play-lh.googleusercontent.com/lPKEePDzkwfh30tzp6WKRAqxzzFZ-Mw-rOZVDRWXuFxiPT6tG_3uZjPoANVqjqCmlao"
      },
      %{
        name: "VIOFO",
        package: "com.viofo.viofo",
        icon_url:
          "https://play-lh.googleusercontent.com/p_b6ks7Uc4ziu0YFhuLG95D-VcO3UOTf3GWubWedI1TRbltUcyJlhv5iKKxdC2JGNKE"
      },
      %{
        name: "VLC",
        package: "org.videolan.vlc",
        icon_url:
          "https://f-droid.org/repo/org.videolan.vlc/en-US/icon_yAfSvPRJukZzMMfUzvbYqwaD1XmHXNtiPBtuPVHW-6s=.png"
      },
      %{
        name: "VPN by Private Internet Access",
        package: "com.privateinternetaccess.android",
        icon_url:
          "https://play-lh.googleusercontent.com/mbB7Vxc16PhEB4RH45VHwFb5doAKSKIm8_c2PGeYCmh3ckQQe8EvaCnqw4ULlnzCscE"
      },
      %{
        name: "VPN by Private Internet Access",
        package: "com.privateinternetaccess.android",
        icon_url:
          "https://play-lh.googleusercontent.com/mbB7Vxc16PhEB4RH45VHwFb5doAKSKIm8_c2PGeYCmh3ckQQe8EvaCnqw4ULlnzCscE"
      },
      %{
        name: "VR Banking",
        package: "de.fiduciagad.banking.vr",
        icon_url:
          "https://play-lh.googleusercontent.com/tAnZZ0hzaHknGAjbBBzH27sJz_B40YQyiHSOazvapBLNZ5Dtz9ckeaoC168ptdoa7w"
      },
      %{
        name: "Venmo",
        package: "com.venmo",
        icon_url:
          "https://play-lh.googleusercontent.com/YAKMX5YFcuE8_NogkbM7gkqrhBY6CUefbpULAVnNZLSitbo9S3Dw2FIYNqhW0d5G94Y"
      },
      %{
        name: "Viber",
        package: "com.viber.voip",
        icon_url:
          "https://play-lh.googleusercontent.com/lB6Ro6pjPw17G8HnTvv_qerC2yMGlvjVpryNXoeKfxyglyB8Ljk1HUxmegKU85acTmQ"
      },
      %{
        name: "Vipps",
        package: "no.dnb.vipps",
        icon_url:
          "https://play-lh.googleusercontent.com/0PbbTOfd4p_kT2iumjByeiQoj4AkK5aHFFeAe61BeW9saYtpY0z4S0CPBjJUN188fpg"
      },
      %{
        name: "Virgin Pulse",
        package: "com.virginpulse.virginpulse",
        icon_url:
          "https://play-lh.googleusercontent.com/EixdDL8d8XomOSgLBSveaWkMTkEHIu42xpTzKQLLFD7PpTVh9hsCGBreiZXSOx63JeU"
      },
      %{
        name: "Vivaldi",
        package: "com.vivaldi.browser",
        icon_url:
          "https://play-lh.googleusercontent.com/PcRA92AlF3NafNYMb2BVFSIohyJVEgEKusVuDZj0nGKV-oQujZANLR4-enR46SqUmg"
      },
      %{
        name: "VyprVPN",
        package: "com.goldenfrog.vyprvpn.app",
        icon_url:
          "https://play-lh.googleusercontent.com/L5lgFrwLfGi_b-WcFhK1-xAPQoTNDSoycTNZOR-K6ibQ-FIVpO0OHk5RjP8d-OoQag"
      },
      %{
        name: "WHOOP",
        package: "com.whoop.android",
        icon_url:
          "https://play-lh.googleusercontent.com/RpXxly7Gn0C_MjCHbynE9QxhMgC2D3PI4CAC7E2ujha2GRqepYWgH9IletL1x5facA"
      },
      %{
        name: "WINDTRE",
        package: "it.wind.myWind",
        icon_url:
          "https://play-lh.googleusercontent.com/WlnKrqkzt4wSwuIVkr1J8Lev_ATE7k8NSs6819iNEQFJvhtNdLrvbW8UsQlMenCyLg"
      },
      %{
        name: "WINNES GPS",
        package: "com.fw.gps.lhyk",
        icon_url:
          "https://play-lh.googleusercontent.com/LxWT1j4cjyktOeC0Go370ZVxMVsNikl23nxLz6RkQich0LXAbNwR4ugv6RVvG1sFMwxU"
      },
      %{
        name: "WX",
        package: "mn.app.wx",
        icon_url:
          "https://play-lh.googleusercontent.com/CeZSDdGxRGQFuJuZBBlHcdG6pzDlacbLyt6TCUi7Vm5SjJgLhBXdcqxEjhFuyA4z2RQ4"
      },
      %{
        name: "Wahoo ELEMNT",
        package: "com.wahoofitness.boltcompanion",
        icon_url:
          "https://play-lh.googleusercontent.com/aqkNGwE2L2BBCMZ1cBx1iwD0niBCc22ael2dhN5DMstuRXJ6nTYovH225d0zplcR2ts"
      },
      %{
        name: "Waking Up",
        package: "org.wakingup.android",
        icon_url:
          "https://play-lh.googleusercontent.com/J0oxp8IHHS2tsPzwdCJWDIoI2EgiNh_YKjm1-O9Gb5q0N3avXr8r6MBKg851l3l6oUgZ"
      },
      %{
        name: "WatchCheck",
        package: "de.uhrenbastler.watchcheck",
        icon_url:
          "https://play-lh.googleusercontent.com/9QE16slJbBQPNQwRYS1V547hhTX_cvOEDxhnT0uoyG4yI7Ba7NnUvBG5GZtqMG2nR_7t"
      },
      %{
        name: "Waze",
        package: "com.waze",
        icon_url:
          "https://play-lh.googleusercontent.com/r7XL36PVNtnidqy6ikRiW1AHEIsjhePrZ8W5M4cNTQy5ViF3-lIDY47hpvxc84kJ7lw"
      },
      %{
        name: "Wear OS by Google",
        package: "com.google.android.wearable.app",
        icon_url:
          "https://play-lh.googleusercontent.com/WmoV-m8b6x16sDRfzebu5b2vstcyBHRrpzCj6ODoh6hGuMa9Gg39EvnOk7z3qMa0_WM"
      },
      %{
        name: "Weather data & microclimate : Weather Underground",
        package: "com.wunderground.android.weather",
        icon_url:
          "https://play-lh.googleusercontent.com/LzUvgH7tSaV1mzA9lzlA8iKnHCrVZnjTYtLZCgIYzN3FhAM84gJ3XLhHhB_6k3Lu9Q"
      },
      %{
        name: "Wells Fargo Mobile",
        package: "com.wf.wellsfargomobile",
        icon_url:
          "https://play-lh.googleusercontent.com/Gv2vz70OxFrAf2HfUo0mfOLt-6k9pp1_ToW6iSUj86Ixy2TKXrP0Z_SuL3-RZbD2KYuJ"
      },
      %{
        name: "Wetherspoon",
        package: "com.wetherspoon.orderandpay",
        icon_url:
          "https://play-lh.googleusercontent.com/z7-lQWmni61-yauwqyqNcvJgx3ZjWcE2sHGIOLWi84s7QZlCRSRZrYdKvo81i6rU7Kzn"
      },
      %{
        name: "WhatsApp",
        package: "com.whatsapp",
        icon_url:
          "https://play-lh.googleusercontent.com/bYtqbOcTYOlgc6gqZ2rwb8lptHuwlNE75zYJu6Bn076-hTmvd96HH-6v7S0YUAAJXoJN"
      },
      %{
        name: "WhenToWork Employee Scheduling",
        package: "com.whentowork.webview",
        icon_url:
          "https://play-lh.googleusercontent.com/bUxUbjNqU1Jq9IE_E02sxjTGJltHA--rPOoY_t7cyWAv_Nc3XraOV4CBBOvz9pB9B8Xe"
      },
      %{
        name: "Wire",
        package: "com.wire",
        icon_url: "https://f-droid.org/repo/icons-640/com.wire.4254666.png"
      },
      %{
        name: "WireGuard",
        package: "com.wireguard.android",
        icon_url:
          "https://play-lh.googleusercontent.com/tixGgVipnsaKeGQzykJfgSEhUc_YYMSsr3gwBuPTpXb2F1BKPVzv5OxfCrpS8OAXXh8"
      },
      %{
        name: "Wise ex TransferWise",
        package: "com.transferwise.android",
        icon_url:
          "https://play-lh.googleusercontent.com/wU1A9m0ExkOTQAixWpggeLFzqeXFrR4A9GU9eDhLCO29AnAW4KzUYx1kyHPe21qPgw"
      },
      %{
        name: "Wolfram Alpha",
        package: "com.wolfram.android.alpha",
        icon_url:
          "https://play-lh.googleusercontent.com/fkytTLBPEEAOZhLHtmV8IC93iETvKDyS71bTXL5hAmNqyYk4-rPBUQbZLLrh0BDzTt0"
      },
      %{
        name: "Workday",
        package: "com.workday.workdroidapp",
        icon_url:
          "https://play-lh.googleusercontent.com/YM9jT_ETnF1btReCKMYUwpFXBatqPKqifwehlX9_GvfEx5K7X-DANT9CBbaSQeMuxQ"
      },
      %{
        name: "XDA",
        package: "com.xda.labs.play",
        icon_url:
          "https://play-lh.googleusercontent.com/JxyKh6pmtKf_k_oprLFo6l2x7gnkuWfjCXOz8-L-9J8zcv8jle3VQUnpZ7KFrkAEykg"
      },
      %{
        name: "Xbox",
        package: "com.microsoft.xboxone.smartglass",
        icon_url:
          "https://play-lh.googleusercontent.com/hihXCV-0wxOXB5N7uBREaJeCVK0BDjNEBtKwNAncftZMflpEvasiKXn7vCKxu9qGpvk"
      },
      %{
        name: "Xfinity Experience",
        package: "mobile.appZefWXXrDOP",
        icon_url:
          "https://play-lh.googleusercontent.com/y3Ti911CYO33meKJAU1OC43geaUKpYWdmVRfyjg9OMD_FI3MUdqlRkfgmY3b3fvBfuw"
      },
      %{
        name: "YNAB (You Need A Budget)",
        package: "com.youneedabudget.evergreen.app",
        icon_url:
          "https://play-lh.googleusercontent.com/3670OMYEbgCVyV1fGdkErGmYIpLtQ7_70LPcXKRQCjfbd819VzSk3b5rYVcQ8aOoCAM"
      },
      %{
        name: "YONO SBI",
        package: "com.sbi.lotusintouch",
        icon_url:
          "https://play-lh.googleusercontent.com/uAGuxZ872xYq99O9O1IgYEceMWAheQyEwZskZ9sE6Xrt1A-WinZkHj3MDAcTcJVLATFP"
      },
      %{
        name: "Yahoo Finance",
        package: "com.yahoo.mobile.client.android.finance",
        icon_url:
          "https://play-lh.googleusercontent.com/jQVXIz4MbsuOJSzoeFsTeL2gHoaZTlBtz2JbyG9JAuhsrTPB2vSvsRqsINWYVUr3Xw"
      },
      %{
        name: "Yahoo Search",
        package: "com.yahoo.mobile.client.android.search",
        icon_url:
          "https://play-lh.googleusercontent.com/xWZvkiGh8swIP2th1KT_Nf5skmDoC0a8v2oE6kJq-zP5FVm1Gr643ITaEwcdR3KLZqc"
      },
      %{
        name: "Yandex",
        package: "ru.yandex.searchplugin",
        icon_url:
          "https://play-lh.googleusercontent.com/WFJgS6wkeaFCVFp3CH6mWOd2sRsWvOxILagnw33PFi4KFYnPsaeCGywSVwqJzwrHtJQ"
      },
      %{
        name: "Yandex Browser with Protect",
        package: "com.yandex.browser",
        icon_url:
          "https://play-lh.googleusercontent.com/CAlpsF5mchuTP6mrEOZW2zXzJKBsVDYWc21K4XiaQKKoEuMhiABJjKWJBc3S6Ux-rY4"
      },
      %{
        name: "Yandex Maps",
        package: "ru.yandex.yandexmaps",
        icon_url:
          "https://play-lh.googleusercontent.com/DLCdDuCkVMI-vQhbNmPJU8cIDZulGHJxYGz_Cm9Mbrv6ssl9TW-RUMXfzczd9NKZj4w"
      },
      %{
        name: "Yandex Metro",
        package: "ru.yandex.metro",
        icon_url:
          "https://play-lh.googleusercontent.com/Hdt61q9_EjCYMLcvBoDbER-k8Y8S-chMjy16cqP_N1rlqYj0ozMC95XBa7gNRDnBtOQ"
      },
      %{
        name: "Yandex Trains",
        package: "ru.yandex.rasp",
        icon_url:
          "https://play-lh.googleusercontent.com/uYT87MBpZg5-gPVUL-0VKwTo7rzeDXwEmfyc196isIx9FrXip1hSTid5M8nQDel1-p4"
      },
      %{
        name: "Yandex Translate",
        package: "ru.yandex.translate",
        icon_url:
          "https://play-lh.googleusercontent.com/DPMwmvTeh8JEeS43OHQW_UGqyNtSbdja6Hk2qu7GGujaMTuSrcFg46YcyHE6f0YMgBDy"
      },
      %{
        name: "Yandex Weather",
        package: "ru.yandex.weatherplugin",
        icon_url:
          "https://play-lh.googleusercontent.com/A3AoMqSCIuDqhGywYXSY1P7PRS8AlSKxDi6a7JnznGSwLEFk8aHGn8AtVqnw2hL6TL0"
      },
      %{
        name: "Yatse",
        package: "org.leetzone.android.yatsewidgetfree",
        icon_url:
          "https://play-lh.googleusercontent.com/Ve_0e7VJ06oUP6cf_ypedb-UqR6GRrbg0dsOganwUnnj4YHZXadCKPJTXE0eViS48Xh-"
      },
      %{
        name: "Yes, that dress!",
        package: "com.zjcgame.superdress",
        icon_url:
          "https://play-lh.googleusercontent.com/j-qXALPZv46p3VV-8-dK_qXW9xrJrVrjM7qlAVCGT1ixfdxdJ_YyaB8vrT2adJ5cbCg"
      },
      %{
        name: "Yi Home",
        package: "com.ants360.yicamera.international",
        icon_url:
          "https://play-lh.googleusercontent.com/lBjUIS5U-KQGoW9as_rrZ28vk0nWsfBRpcdjnvPeLedQPvcFhG6dZDZUNwao3FUuROE"
      },
      %{
        name: "YouApp",
        package: "com.lynxspa.bancopopolare",
        icon_url:
          "https://play-lh.googleusercontent.com/Dt9eWeZ3s6zjNtyssp1k2O9yDaeGuo6YDdLBFb2opTwCS0egqQYQiZ5fY_uyqhJY13o"
      },
      %{
        name: "YouTube",
        package: "com.google.android.youtube",
        icon_url:
          "https://play-lh.googleusercontent.com/lMoItBgdPPVDJsNOVtP26EKHePkwBg-PkuY9NOrc-fumRtTFP4XhpUNk_22syN4Datc"
      },
      %{
        name: "YouTube Kids",
        package: "com.google.android.apps.youtube.kids",
        icon_url:
          "https://play-lh.googleusercontent.com/S4wylkvt2jz16hnG9IG0pAZosbB82nWWy8P-rQkb54uH-SCVd5L2j7z7x1Vz5pZvIRc"
      },
      %{
        name: "YouTube Music",
        package: "com.google.android.youtube.tvmusic",
        icon_url:
          "https://play-lh.googleusercontent.com/76AjYITcB0dI0sFqdQjNgXQxRMlDIswbp0BAU_O5Oob-73b6cqKggVlAiNXQAW5Bl1g"
      },
      %{
        name: "YouTube Studio",
        package: "com.google.android.apps.youtube.creator",
        icon_url:
          "https://play-lh.googleusercontent.com/SM1nwJaePNm9Q6vVgU0CvvmR1uozbZYU8ohKfBCIndZy0sSGtwmObhpBcUkTOqcyYg"
      },
      %{
        name: "Yu-Gi-Oh! Duel Links",
        package: "jp.konami.duellinks",
        icon_url:
          "https://play-lh.googleusercontent.com/WbBQM77g4flbQJgE1_f6QXvapSQWG2zDEs8mMvqRyMNW9xEU7QZ3XHIq4Om3Dm80-W8Z"
      },
      %{
        name: "Yubico Authenticator",
        package: "com.yubico.yubioath",
        icon_url:
          "https://play-lh.googleusercontent.com/pMQnwiyTHqzRjo6gMaiCe98F8ZXhcrkoReToVSXKVGrSfv677EPPF43btDK6h4Wz8O4"
      },
      %{
        name: "Yuka",
        package: "com.tgw.yuka",
        icon_url:
          "https://play-lh.googleusercontent.com/umq_Y2UXKAm8mXnNSx39b_QusUzPRWBeMTI_fsoMLk_ryg64bdfh4cn_ohTIQZPMssy9"
      },
      %{
        name: "ZOOM Cloud Meetings",
        package: "us.zoom.videomeetings",
        icon_url:
          "https://play-lh.googleusercontent.com/yZsmiNjmji3ZoOuLthoVvptLB9cZ0vCmitcky4OUXNcEFV3IEQkrBD2uu5kuWRF5_ERA"
      },
      %{
        name: "Zara",
        package: "com.inditex.zara",
        icon_url:
          "https://play-lh.googleusercontent.com/Etar8ijdCl_bYMpgCEnHlS505Dkgh-BmUJjmQCSlzyv-8o8Acp7BFxfFiGtju1DTMuqT"
      },
      %{
        name: "Zara Home",
        package: "com.inditex.ecommerce.zarahome.android",
        icon_url:
          "https://play-lh.googleusercontent.com/RRSgc62GD7QhPHfUT6gm3wA80T_dJQ2m-zPyU8kMg5x-lDGkAa_XudlCqtJ_Wjx5LSM"
      },
      %{
        name: "Zepp",
        package: "com.huami.watch.hmwatchmanager",
        icon_url:
          "https://play-lh.googleusercontent.com/CclD01R8ED8BNGSn_xi699zNnDgtoGGSubKqPEm9f3_IhjysF7pADrxdl6ADbjHI_vc"
      },
      %{
        name: "Zoho Cliq",
        package: "com.zoho.chat",
        icon_url:
          "https://play-lh.googleusercontent.com/LqEBgOywGOcqdRoU5BIBTC_X57i8iLRhS94pBVUsa0MilZN9QKQ4xXSD6rRK8yVpJC4"
      },
      %{
        name: "Zoho Email",
        package: "com.zoho.mail",
        icon_url:
          "https://play-lh.googleusercontent.com/9AjFvEP6RP6zRd41Z9cuiyHe_qD47a1AN0QrvW9Ec0OfsmG9x-t09nmTQMAmmZuYrdso"
      },
      %{
        name: "Zoho OneAuth",
        package: "com.zoho.accounts.oneauth",
        icon_url:
          "https://play-lh.googleusercontent.com/STjz5rBmuEBYS_0H12apOzLsP1kOcX9HgPh4uj7wH65DAABR8YmXlNH1fUzrfLCU1kyM"
      },
      %{
        name: "Zoho Workdrive",
        package: "com.zoho.work.drive",
        icon_url:
          "https://play-lh.googleusercontent.com/bCaCkhACozUzttGibwvdVhQCpv_9U9YxJGukum4dp0Y3I0LDkRvbmW1TWbLWB3BQp9M"
      },
      %{
        name: "Zombie Tsunami",
        package: "net.mobigame.zombietsunami",
        icon_url:
          "https://play-lh.googleusercontent.com/y2v9w4KjUe4djmd3yYgj2_XrDIt_D9JO2c2NkYdxtYyE6cGl21JgU4aMqTEcoQzQorLD"
      },
      %{
        name: "Zulip",
        package: "com.zulipmobile",
        icon_url:
          "https://play-lh.googleusercontent.com/JEo4Q5Ed3TIJRxL8A-moTh0HoYF74Hmg4WFISopAach2CjcpgSiTDQXU2d6JnxNz0g"
      },
      %{
        name: "Zwift Companion",
        package: "com.zwift.android.prod",
        icon_url:
          "https://play-lh.googleusercontent.com/E--bzoWt7rhXb7ZgRH5RySLVPg7JTqB7CTgCCgYVwf5miOnx54jWyQca1O6tMYOJAw"
      },
      %{
        name: "aTimeLogger",
        package: "com.aloggers.atimeloggerapp",
        icon_url:
          "https://play-lh.googleusercontent.com/sp-tqT8_wO-6lK8Kr-UByGxNyGLPQge-6jjYZp5ydNQ7h0HHzv0XgKdNwOdt8-G585tJ"
      },
      %{
        name: "adidas",
        package: "com.adidas.app",
        icon_url:
          "https://play-lh.googleusercontent.com/iPzanFznFsaq0QPJ320jnt5MkFcs6katVZXW5JWTM7Mrdt9oOETeLVJBEf6Lpy52MIys"
      },
      %{
        name: "c:geo",
        package: "cgeo.geocaching",
        icon_url:
          "https://play-lh.googleusercontent.com/gS5-NXHaN1P18AlvesdsKux_milDZjesocUHvQTb0P6QtabtbQAJ4pUlKkO87VNZ_Tg"
      },
      %{
        name: "dscout",
        package: "com.vokal.dscout",
        icon_url:
          "https://play-lh.googleusercontent.com/ex5sKY7g4OzAkTigj7wLjG8wBWNI6t4kfV59ichSEMg61U7iwPF6FJ1O5qTbOAgG2Q"
      },
      %{
        name: "eBay",
        package: "com.ebay.mobile",
        icon_url:
          "https://play-lh.googleusercontent.com/31-mJUIynIfQBizOn-w1yWLKHBxVeRKA3gz348_E3K-TnuEaqCjn_-Fr9j0yQ6i0y5E"
      },
      %{
        name: "eBay Kleinanzeigen",
        package: "com.ebay.kleinanzeigen",
        icon_url:
          "https://play-lh.googleusercontent.com/Gp8B-Dg35FTRhYQv8s0OW3jQY1nIsPXpKINH6UFFncdXkE2_sC0zEf5VPM5UAb8ugIE"
      },
      %{
        name: "eBird by Cornell Lab",
        package: "edu.cornell.birds.ebird",
        icon_url:
          "https://play-lh.googleusercontent.com/lAzNimiJjlYgiceg5AdhVlb_6Q-n_5i7rnpAPoFOZXHUSaE0yxXRwkZYzL3qUQmru2QO"
      },
      %{
        name: "giffgaff",
        package: "com.giffgaffmobile.controller",
        icon_url:
          "https://play-lh.googleusercontent.com/g5bIh1ECjhAhOJhq79AwyfqUg5a8VOFV6HT9mDpT_2XtQ5ln-TGT_X5tZU8w43WKdQ"
      },
      %{
        name: "hotukdeals",
        package: "com.tippingcanoe.hukd",
        icon_url:
          "https://play-lh.googleusercontent.com/5CPADJPHH4ML4ReS8qNNXnYVU_N0yAUMa2E44e8la6SgItVdur-UELFJv4yXVJn4ew"
      },
      %{
        name: "hypo@mobile",
        package: "com.hypotirol.mobilebanking",
        icon_url:
          "https://play-lh.googleusercontent.com/mLwf86U6PFWOCD7ItMveF6rA8fqCkg6hzJVKLb5vQYmCYJsYoVcY0xIGx3a_2beKlw"
      },
      %{
        name: "hypoGO",
        package: "com.hypotirol.hypo.go",
        icon_url:
          "https://play-lh.googleusercontent.com/-eZCoE4RaS1LtP3TQIlc1O1NGOUyGhyQ3usZxmad35HjldIaNalPMCuWq06nClc7jsM"
      },
      %{
        name: "iGym Notes",
        package: "com.softmaestri.sports.igymnotes",
        icon_url:
          "https://play-lh.googleusercontent.com/QR09I7AG5Gv9ZF4Um4uEMTtDe21lIYw-5PPSzBOVH2b9alLA5f-g9VDX536vdorYXvCi"
      },
      %{
        name: "iPray",
        package: "com.guidedways.ipray",
        icon_url:
          "https://play-lh.googleusercontent.com/gB_srfihcw4hrKtuGceYpgydnWB8IJ_2wdzgPVuohnIxBkbRv4vMHpbC11ECNosJPg"
      },
      %{
        name: "itslearning",
        package: "com.itslearning.itslearningintapp",
        icon_url:
          "https://play-lh.googleusercontent.com/KUD1NkfHRSwOoGTEocA_iLUuLBVMbzoK1OuzbgjXWUXC5WqV0_WomOVtFlcBaluAEggc"
      },
      %{
        name: "mBank SK",
        package: "sk.mbank",
        icon_url:
          "https://play-lh.googleusercontent.com/zjgold7CvBDGWeJBAs28jY4aNxksScCP5gSBvNQjkwCGQhPHeyjk9nlwhBoCCu19iyQ"
      },
      %{
        name: "meduza",
        package: "io.meduza.meduza",
        icon_url:
          "https://play-lh.googleusercontent.com/InAZ4z4IHFsmhsQ0NImL6XR_yTq7vqFVUpFTGI912Ez6XRPT1stPkbbr1CFSzntk9RA"
      },
      %{
        name: "monerujo",
        package: "com.m2049r.xmrwallet",
        icon_url:
          "https://play-lh.googleusercontent.com/5EX2-QpRt13u6oi6nbyw5ejp18MMqfSmHQcLiNz7230zsQgplfoo1KTQAWg5__rQwfo"
      },
      %{
        name: "mySolarEdge",
        package: "com.solaredge.homeowner",
        icon_url:
          "https://play-lh.googleusercontent.com/jbMCRDYB3Nc-oCpBnh6X_w8oRPjLIJU2VzG2Ff6YPrWpn9n0Uje2RbGig4oAOjb8cQkB"
      },
      %{
        name: "myStop Mobile",
        package: "com.AvailTec.MyStop",
        icon_url:
          "https://play-lh.googleusercontent.com/Gs7ZZxizB-OsgrJSTHLczy4yu3A5503GgVjk45AMnGbDmEr1iKd1YoDrzFfjcfIbrTc"
      },
      %{
        name: "mydealz",
        package: "com.tippingcanoe.mydealz",
        icon_url:
          "https://play-lh.googleusercontent.com/oJRoMOc3FglrLpbrkaywuIZ4URJmTAV8UupHR7J9Ij_2LOQ3J22ta70Xrdkn88_IYQ"
      },
      %{
        name: "netcup SCP",
        package: "at.anexia.netcupscp",
        icon_url:
          "https://play-lh.googleusercontent.com/TcK1eRb5_z3KJTozb0k2MyJqEAsnSep-p0UaO1odB-75rnRavLghRoRlnUrAH0koatJp"
      },
      %{
        name: "nextbike",
        package: "de.nextbike",
        icon_url:
          "https://play-lh.googleusercontent.com/D7PIayzmbM6k0aSqDPxQz2DzXbnFAY0s2Io9YdtgX85BaQv9CsuYR5mxaxY1qPsRPg"
      },
      %{
        name: "nzb360",
        package: "com.kevinforeman.nzb360",
        icon_url:
          "https://play-lh.googleusercontent.com/hjpWUw2sBsC0fpbPFUAChsjx-yC0-57zjZLdG8GQUw_FhVehK19pY0HIdDDysrdh7BM"
      },
      %{
        name: "pCloud",
        package: "com.pcloud.pcloud",
        icon_url:
          "https://play-lh.googleusercontent.com/5C2U8bk9x9-SzmJqy4xb9urLqwY1JvX-kU4EEVL-bSSEjv1wyM7IT7o4svuAKbsHUoA"
      },
      %{
        name: "park4night",
        package: "fr.tramb.park4night",
        icon_url:
          "https://play-lh.googleusercontent.com/CC1NYh0U18AcqP42V981Qh7myehBrCqlqCrOAtuTxB_Trm9q15kq_tFOok9PBqcierE"
      },
      %{
        name: "paydirekt",
        package: "com.gimb.paydirekt.app",
        icon_url:
          "https://play-lh.googleusercontent.com/GIvpWRL-HE3X6KXAD2Nluv99ZsSGH3jyMEfiZaOild7r_UfYY_IGtoMtGD3BE3bXg2G7"
      },
      %{
        name: "rif is fun for Reddit",
        package: "com.andrewshu.android.reddit",
        icon_url:
          "https://play-lh.googleusercontent.com/7eZdn-k3hT4CyxcEztIRPgZiaCS13bbombYFnonJvMRttjHFUzVSkJce61x6pyPiHQs"
      },
      %{
        name: "slither.io",
        package: "air.com.hypah.io.slither",
        icon_url:
          "https://play-lh.googleusercontent.com/oObkhKfUXOY5yzheKe9w1Y1pXZBgdiSksMeNmT0BijoQ8J75maTCIW2TA7-6pA6EMA"
      },
      %{
        name: "sparuniversity",
        package: "nl.socialbrothers.campuslife",
        icon_url:
          "https://play-lh.googleusercontent.com/4gl-NZQDD8FN6-4axAPgglgQjNMMDTfsg1F-iyp-CIe5erZnZXETnbOC1hArzhCJJvY"
      },
      %{
        name: "v2rayNG",
        package: "com.v2ray.ang",
        icon_url:
          "https://play-lh.googleusercontent.com/x3RFim6Fb-bgRd-HnV9VNrdqBRueyOuUjvu7ZNv7eRYC5Idl3WU_GSxa7bpx5yyUT30"
      },
      %{
        name: "what3words",
        package: "com.what3words.android",
        icon_url:
          "https://play-lh.googleusercontent.com/WftcssbkDX_lY6Bs4gv7t-9xlh-P-ZZ-GqxjIDLqEdKu-VT-8_unt9uQpI7ePUErKC8"
      },
      %{
        name: "CHMU",
        package: "cz.oksystem.chmu.basic",
        icon_url:
          "https://play-lh.googleusercontent.com/Gm-EsISqZvR0RmYiUa5DTALnkUJxGEtmW1mvDwW1v01jy9kzjUA7QXy-0IznJsu69wc"
      }
    ] do
  app =
    case Plexus.Repo.get(App, params.package) do
      nil -> %App{package: params.package}
      app -> app
    end

  app
  |> App.changeset(params)
  |> Plexus.Repo.insert_or_update!()
end
