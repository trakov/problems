class Devices {
    
    func tests() {
        var i = 0
        while i < strings.count {

            let name = strings[i]
            let UDID = strings[i + 1]
            
            if name.starts(with: "S.") {
                print(String(format: "%@\t%@\tios", UDID, name))
            }
            
            i += 2
        }
    }
    
    let strings = [
        "S.Darrell Stephenson",
        "fe7b5a85ff749fc75a3b0bc27bf63e4b8a7efbd7",
        "Michael Rublev (iPhone 7)",
        "956aeff2c6c47fb08f44ede2a651743a54864eb2",
        "S.Tony Ourique",
        "719fb8ea04b063b909dac595bfcf392ddfe474ff",
        "Evgene Bakharev (iPhone 5S)",
        "bf8a99eb63eae37057a014db4b2b0cf75a3c9bb3",
        "S.Jeff Hicks",
        "7449f22d83fa4734f25ee95d8e2d4fb699cef16d",
        "S.Jeff Fitzsimmons",
        "43406f77c6b6f6eff78938adfb2a6ef408e5cbdd",
        "S.John Correia",
        "9ccf88e623770b33e04a8f00e3fa206c0211d5e9",
        "S.Kevin Anderson",
        "508b4fec3e520c761a50c1f3766ee1cc2f027d54",
        "Sam iPhone X",
        "ffb15798098f49adcb0d5f189a4e5397bf3a5f49",
        "S.Paul Struiksma",
        "fab857d299437b56492fbd7be15f7ca229df6d20",
        "S.Gary Dinis",
        "51acb96dcbe516d80def0ad35edf65090c879d3f",
        "S.Marco pereira",
        "af66f2af9e533744c74b9556c1f4e4d95fb9ddbd",
        "S.Maurice",
        "c04cd8d4b86d8d2e4ddd49c7c6fa3d998543547b",
        "S.James Cadigan 2",
        "00008020-0015293136E9402E",
        "S.Rod",
        "9054e8baf08150e8d08f07e13e702b33fda16967",
        "S.Jim clark",
        "5cb378489620da5b7d9c3d1ff1ce5291ae0b352d",
        "S.Brandon kean",
        "94517d96ccc656df51a26e4c1e55106e663afee1",
        "S.Test 6",
        "00008030-000665EE1EE3C02E",
        "S.Jim Clark",
        "68009206e6eafc74e32369aaf3a8a0a2ace4d27d",
        "S.Angelo frias",
        "c579104c0daa065f2bda5c6c58c427d486a92782",
        "to_delete_S.Norm Young",
        "a149076fcc616ecbcbe8c5a57a2c0cd28b3755c1",
        "David's iPad mini 2",
        "11b7401d2cfe9df4f712df352f41f16ec0ade484",
        "S.Dave Milley",
        "52bc8a390670ab0eed07cccbec4ff5b02a299ed7",
        "S.Test 1",
        "00008030-000854413E30C02E",
        "Joe M (iPhone 7) - Triple",
        "e3dd6fc5b7ba7fc66d5b287fa4ebff778b553fec",
        "S.Mike Mulvale",
        "f53efd158cacef4a94c96b731b3c419ca0ed9f2b",
        "S.David oliver",
        "729797ddafdd5c259a9cf1006e2bd03c7a8758a2",
        "S.Gary Dinis 8",
        "00008030-00122D303A07402E",
        "S.Gary Dinis 7",
        "00008020-0016653936F1402E",
        "S.Gary Dinis 3",
        "ba84f47cc3038d08388a6355a395b560f7e5b332",
        "Kyle Hendrickson iPhone 6",
        "88d25871c51cc903f0613c46d103944d65dac138",
        "S.Manuel Sandim",
        "f492ef71783625285da8d857a9ac16c7847bcd40",
        "Artem Obuhov (iPhone 6)",
        "bfa5534de4662f089f72f93b1278ff7884155e79",
        "S.Gary Dinis 10",
        "00008030-0001552E0E28C02E",
        "S.Gary Dinis 14",
        "00008030-0004681A3A78C02E",
        "Boris iPhone 6",
        "02b30bbf30d78b9ed8a6f8a93143e6cb7939f616",
        "S.Rick LaForest",
        "5188426a450c86a4bb8a2c75f61eafb94ae2bbbb",
        "S.CReilly",
        "00008030-0001446836A0C02E",
        "Nikita Krichfalushiy (AppleTV 4K)",
        "594530af0dd69f38e4bdf1dcc65dd08c4115ecda",
        "Ann Hendrickson iPhone 8 Plus",
        "e63a5dafa84159e4ad906c982679c99593985c8a",
        "S.Terry ONeill",
        "8b17ac4e8705b870bc98f338213e3bd0b2f95758",
        "S.Test 5",
        "00008030-001959C921C3C02E",
        "S.Gary Dinis 19",
        "00008030-001C74AC0A43C02E",
        "S.Paul Burt",
        "1d8238fd380df418d9b522fd5dc8a8a988ea39b1",
        "S.Perry Rideout",
        "ca6dd138451549c02cd640e6d9a898afae11dd37",
        "S.James Boylen",
        "c9bdad3d2c661e7788e88e9778f093abda893f05",
        "S.Gary Dinis 18",
        "00008030-001A599C0143C02E",
        "S.iPad",
        "ef7973fa8c80a467266cb3b353c38be3be36c9b6",
        "S.Jason Forget",
        "fd2229e297f71cb54f12a811cb983b457a282bce",
        "Chris H (iPhone 7) - Triple",
        "9c0b6fc909c7e81977f25b3ef60fc6336dee12d0",
        "S.Ryan Clarke",
        "489daef068195f4757bb67eecfe168d0b17e1249",
        "to_delete_S.Joe",
        "226122c6dbfa6dcab6405be499c33d405e99d4c0",
        "David's new iPhone",
        "f55c59cfa9ca74016e4dbaeb67e32148414d0a3c",
        "S.Ryan Murphy",
        "847b5bf2d88f8199eeb5cef208d6c7900c2bff89",
        "S.Gary Dinis 17",
        "00008030-001A39101EF0C02E",
        "Nikita Krichfalushiy (iPad mini 2)",
        "4bc7de756f564ec4b158d8391922bfc8205ee675",
        "Sarah Sabine (iPhone 7)",
        "6af57a3ab1d95383d0ea014392f584792d610501",
        "David iPhone 6S",
        "16f460a84f6099f6c83d2b588cf154efd3584a40",
        "S.Mike Fazzari",
        "0f512883bac2599bc44cb34742e6d75fb71a8a39",
        "S.Gary Dinis 5",
        "00008020-000671490A80C02E",
        "S.Adam",
        "00d889c7b68d981dd0335395605d75b70a6aa294",
        "Nikita Krichfalushiy (iPhone X)",
        "27965a3352a2bbda77ffa1c367400a8b532f2adc",
        "S.Neil",
        "1fda483e8078719b977636c2a30817047547de9a",
        "Sharon S (iPhone 8)",
        "ce21e174d601325803f09e4d370054e25f38271e",
        "S.Jamie",
        "a1804e91de4b558a2c7037cb7746e71578291b40",
        "David iPhone 8",
        "bf170b18e15d8b5def20ccf1dd3165a4abfa1aab",
        "S.Gary Dinis 15",
        "00008030-0005183C2668C02E",
        "S.Jeff Lobraico",
        "aef835f8f49736bcda9cc8ee56dd3e6e74ed0781",
        "S.John Domenicone",
        "17faf9a8c51cac219fd0cf781092de1acdb046c7",
        "S.F.Oliver",
        "00008020-001D18581A61402E",
        "S.SBurt",
        "00008020-001670813CBA402E",
        "David Napper iPad mini",
        "e2df595a10a5da73e78b52bb443f70999e85e503",
        "S.Scott",
        "75d6945c4e31bf56bac45bf3e466fe524481958b",
        "S.Trevor",
        "6ab595e5c36f49f63165b4ef74866a600e1ad0a5",
        "S.Scott",
        "6165f6f303a04438bbbd355f13f215ae072f2c81",
        "S.Gary Dinis 6",
        "00008020-000B446602F1402E",
        "Roger Hoang (iPhone X) Triple",
        "9e97900ca9ebd9b6ed83492131b8eabf33c87fc3",
        "David Napper iPhone 8",
        "6c83d814fda789991fa39d742f387f9bf203959a",
        "S.Gary Dinis 9",
        "00008030-000C0DCE1A30C02E",
        "S.jclark",
        "00008030-000858AC1E20C02E",
        "Kyle (iPad Air 2)",
        "8d26d3a166bb5f8b923f0276ad334994d41dad28",
        "S.Gary Dinis 4",
        "00008020-000C759E2EF3402E",
        "to_delete_S.Joel nagy",
        "664a204a35ad92cbe713c5c2a385149dfac0c5ef",
        "S.Chris Reilly",
        "352cc3d2fa1293527392bea7bd6ff4b86c7146a5",
        "David Napper iPad mini 4 Wi-Fi + Cellular",
        "a6ff59f846bd16ef30353b21e689fa697c2beaec",
        "David Napper iPad mini 4",
        "5470c28e80195143b8a25a3ad66b3489828c4b4b",
        "S.Matt5901",
        "327ae0a7879e76d01e6d944164cdb3533c152c59",
        "S.Tony Ourique (mini 2)",
        "e40b004f547c1a6e8465292b719f041fbccd9c25",
        "S.Angus Denbroeder",
        "a78e032e0d86d591db9af3de189043293ab6836f",
        "S.Ryan Tarsey",
        "5e54f1edbe9fefbf134e72d5ba64c976e3cd7dfa",
        "S.Jason",
        "5c9ecf53a75bb18eb209a2588d092211e5e321a5",
        "S.Gary Dinis 16",
        "00008030-001641613CE8C02E",
        "Natalia Krichfalushiy (iPhone 6)",
        "94c852c362fa6a21218b6b3d84e9048f5418bdfb",
        "S.Gary Dinis 2",
        "7ce7190bed393c977ae3c48420745cd2a4486eb5",
        "S.Gary Dinis 12",
        "00008030-000A39323E68C02E",
        "S.J.Hamel",
        "6893f158458363295202c8ec874a6cb2ddc60f24",
        "S.Test 2",
        "00008030-0012689A0AA3C02E",
        "iPad",
        "00008027-001D38682131802E",
        "S.Gary Dinis 13",
        "00008030-00012CDC14E8C02E",
        "Allen Louie (iPhone 7)",
        "ffadc27b83c84f8494e650882d0f483489a554cc",
        "S.Kirk Thompson",
        "ef7a1798d159ca26f04e1f29aba0f957b79d6862",
        "Triple O's (iPhone 7 Plus)",
        "23a5e093ce71febda4eb3b35d9be1daf9383ccf7",
        "S.Mike Lord",
        "cf03a3d355593b4913b2b6ad64a6f2e4097004fc",
        "S.Kirk Judge",
        "995b2ebd5a4faeca9843a442d307278a5e3b60af",
        "Paul Volk (iPhone 7 Plus)",
        "4e76e6171f74ba8938847793c07f4f7366d0eb4c",
        "Sarah Wong (iPhone 6s)",
        "d09368a5c1095e361df3be1df13024ed41573e6f",
        "S.AClement",
        "00008020-001450511A28402E",
        "S.Test 4",
        "00008030-001269443604C02E",
        "S.Joe Vitanyi",
        "c3c6920dbf31525f5aeee2db7fab271f59d18f4f",
        "Sergei Zaytsev iPhone 7",
        "cccd5631383e0d99214fc1c4ae42bfcbc2e4bf6e",
        "S.Gary Dinis 11",
        "00008030-001C21A93EF8C02E",
        "S.Max Macfarlane",
        "6b3fc71bb00d600afd3fa1ea9b66ffab7534e84c",
        "S.Eldege25254",
        "b032667449f03b51dc734243cb643b3cc86b8bef",
        "S.James Cadigan",
        "be019fc9a303923259b80223778b1dd13a1eff20",
        "Paul Day(iPhone 7) - Triple",
        "635e468017ceb461c8b33d1008b6775724aa0d10",
        "Weilun Huang (iPhone Xs Max) - Triple",
        "00008020-000E702902EA002E",
        "David Napper",
        "fc1a5b8a7261a965c6b6c6580f68cddd8c17299f",
        "David Napper - iPhone 12",
        "00008101-001379D12E46001E",
        "S.Scott Murden",
        "05999d790370f694ef4137df61fd1e84f74a44c6",
        "S.Michael Rublev",
        "717c1801a649a69bd00f663dc80070c415b42f64",
        "S.Andrew",
        "92c0710b8321f97639d13472ea93fefca086a273",
        "Ally Guy (iPhone 7) - Triple",
        "d65ad8a4c855cd6c0e0fc31296a08f893eb47d02",
        "S.Test 3",
        "00008030-000A194E0E04C02E",
        "David iPhone 8",
        "d7248c4602bf0a1038ed4fd76c9577bdca50af9a",
        "S.ricklaforest",
        "00008030-000C79063607402E",
        "S.Jay pee Custodio",
        "6eef74c0ef274d33d59df77430b886a9e894fc1f",
        "S.Matt Muzzin",
        "41c7dec54b50fe61704ed3565cd4353b4f19d565"
    ]
}
