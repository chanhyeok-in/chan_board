<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Proton Transfer</title>
    <link rel="shortcut icon" href="#" />

    <!-- Not required for proton -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://unpkg.com/@tailwindcss/forms/dist/forms.min.css" rel="stylesheet">

    <!-- Required for proton -->
    <script src="https://unpkg.com/@proton/web-sdk@3.3.1"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <style type="text/css">
      .coin{
        width:300px; !important
      }
    </style>
    <script type="text/javascript">
      function selectCoin(info) {
        var infos = info.split("||");
        $('#currency-image').attr("src", infos[0]);
        $('#currency-contract').val(infos[1]);
        $('#currency-item').val(infos[2]);
       } 
    </script>
  </head>

  <body>
    <div class="relative bg-white">
      <div class="max-w-7xl mx-auto px-4 sm:px-6">
        <div class="flex justify-between items-center border-b border-gray-200 py-6 md:justify-start md:space-x-10">
          <div class="hidden sm:block flex justify-start">
            <span class="sr-only">Proton</span>
            <img class="w-auto h-8 sm:h-10" src="https://protonresources.com/img/logo.475b3e38.svg" alt="">
          </div>
  
          <nav class="flex cursor-pointer space-x-4 sm:space-x-10 justify-center pr-2">
            Transfer
          </nav>
  
          <div class="flex items-center justify-end space-x-8 md:flex-1 lg:w-0">
            <div>
              <div
                id="login-button"
                class="cursor-pointer whitespace-nowrap bg-purple-100 border border-transparent rounded-md py-2 px-4 inline-flex items-center justify-center text-base font-medium text-purple-600 hover:bg-purple-200"
              >
                Login
              </div>
          
              <div
                id="avatar"
                class="relative"
              >
                <div>
                  <div
                    class="max-w-xs bg-white rounded-full flex items-center text-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cyan-500 lg:p-2 lg:rounded-md0"
                    aria-haspopup="true"
                  >
                    <img
                      id="avatar-image"
                      class="hidden sm:block h-8 w-8 rounded-full"
                      alt="Profile Photo"
                    />
          
                    <span
                      id="avatar-name"
                      class="ml-1 sm:ml-3 text-gray-700 text-sm font-medium lg:block"
                    >
                    </span>

                    <svg
                      id="logout-icon"
                      aria-hidden="true"
                      focusable="false"
                      data-prefix="far"
                      data-icon="trash-alt"
                      role="img"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 448 512"
                      class="ml-2 w-4 h-4 cursor-pointer"
                    >
                      <path
                        fill="currentColor"
                        d="M268 416h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12zM432 80h-82.41l-34-56.7A48 48 0 0 0 274.41 0H173.59a48 48 0 0 0-41.16 23.3L98.41 80H16A16 16 0 0 0 0 96v16a16 16 0 0 0 16 16h16v336a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128h16a16 16 0 0 0 16-16V96a16 16 0 0 0-16-16zM171.84 50.91A6 6 0 0 1 177 48h94a6 6 0 0 1 5.15 2.91L293.61 80H154.39zM368 464H80V128h288zm-212-48h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12z"
                        class=""
                      >
                      </path>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="p-8 flex items-center justify-center bg-white">
      <div class="w-full max-w-xs mx-auto space-y-5">

        <div>
          <label for="coin" class="flex text-sm font-medium text-gray-700">Currency</label>
          <div class="mt-1">
              <input type="image" name="currency-image" id="currency-image" class="sm:block h-11 w-11 rounded-full border-gray-300">
              <input type="hidden" name="currency-contract" id="currency-contract">
              <input type="hidden" name="currency-item" id="currency-item">
              <select id="currencyList" class="coin" onchange="selectCoin($('#currencyList option:selected').val())">
              </select>
          </div>
        </div>

        <div>
          <label for="email" class="flex text-sm font-medium text-gray-700">From</label>
          <div class="mt-1">
            <input
              id="from-input"
              type="text"
              name="from"
              id="from"
              class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
              disabled="true"
              placeholder="Please login"
            >
          </input>
          </div>
        </div>
  
        <div>
          <label for="email" class="flex text-sm font-medium text-gray-700">To</label>
          <div class="mt-1">
            <input
              id="to-input"
              type="text"
              name="to"
              class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
              placeholder="e.g. token.burn"
            >
          </input>
          </div>
        </div>
        <div>
          <label for="email" class="flex text-sm font-medium text-gray-700">Amount</label>
          <div class="mt-1">
            <input
              id="amount-input"
              type="text"
              name="amount"
              class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
              placeholder="e.g. 1.3"
            >
            </input>
          </div>
        </div>
  
        <div class="flex justify-center">
          <div
            id="transfer-button"
            class="cursor-pointer whitespace-nowrap bg-purple-100 border border-transparent rounded-md py-2 px-4 inline-flex items-center justify-center text-base font-medium text-purple-600 hover:bg-purple-200"
          >
            Transfer
          </div>
        </div>
      </div>
    </div>

    <script type="module">
      let link = undefined;
      let session = undefined;
      let accountData = undefined;

      const appIdentifier = "taskly"
      const chainId = "384da888112027f0321850a169f737c33e53b388aad48b5adace4bab97f437e0"
      const endpoints = ["https://proton.greymass.com"]

      const loginButton = document.querySelector('#login-button')
      const avatar = document.querySelector('#avatar')
      const avatarName = document.querySelector('#avatar-name')
      const avatarImage = document.querySelector('#avatar-image')
      const logoutIcon = document.querySelector('#logout-icon')
      const fromInput = document.querySelector('#from-input')
      const toInput = document.querySelector('#to-input')
      const amountInput = document.querySelector('#amount-input')
      const transferButton = document.querySelector('#transfer-button')


      const getAvatarImage = () => {
        const avatar = accountData && accountData.avatar

        if (avatar) {
          if (avatar.indexOf('/9j/') !== -1) {
            return `data:image/jpeg;base64,${avatar}`
          } else if (avatar.indexOf('iVBORw0KGgo') !== -1) {
            return `data:image/png;base64,${avatar}`
          }
        }

        return 'https://bloks.io/img/proton_avatar.png'
      }

      const updateStatus = () => {
        avatarImage.src = getAvatarImage()

        if (session && session.auth) {
          avatarName.textContent = session.auth.actor.toString()
          fromInput.value = session.auth.actor.toString()
          loginButton.style.display = "none"
          avatar.style.display = "block"

        } else {
          avatarName.textContent = ""
          fromInput.value = ""
          loginButton.style.display = "block"
          avatar.style.display = "none"
        }
      }

      const login = async (restoreSession) => {
        const { link: localLink, session: localSession } = await ProtonWebSDK({
          linkOptions: {
            endpoints,
            chainId,
            restoreSession,
          },
          transportOptions: {
            requestAccount: appIdentifier
          },
          selectorOptions: {
            appName: "Taskly",
            appLogo: "https://taskly.protonchain.com/static/media/taskly-logo.ad0bfb0f.svg",
            customStyleOptions: {
                modalBackgroundColor: "#F4F7FA",
                logoBackgroundColor: "white",
                isLogoRound: true,
                optionBackgroundColor: "white",
                optionFontColor: "black",
                primaryFontColor: "black",
                secondaryFontColor: "#6B727F",
                linkColor: "#752EEB"
            }
          }
        })
      
        link = localLink
        session = localSession

        updateStatus()

        getCurrency()
      }

      const getCurrency = async => {
         if (!session) {
          throw new Error('No Session');
        }else{
          $.ajax({
            type:"GET",
            url:"https://www.api.bloks.io/proton/account/"+session.auth.actor+"?type=getAccountTokens&coreSymbol=XPR",
            success : function(res){
              
              $.each(res.tokens, function(index,item){
                $('#currencyList').append("<option  value='"+item.metadata.logo+"||"+item.contract+"||"+item.currency+"'>"+item.amount+' '+item.currency+"</option>");

              });
              
            }
          });
        }
      }
      
     

      const logout = async () => {
        if (link && session) {
          await link.removeSession(appIdentifier, session.auth, chainId);
        }
        session = undefined;
        link = undefined;

        updateStatus()
      }

      const transfer = async ({ to, amount }) => {
        if (!session) {
          throw new Error('No Session');
        }

        return await session.transact({
          actions: [{
            /**
             * The token contract, precision and symbol for tokens can be seen at protonscan.io/tokens
             */

            // Token contract
            account: $('#currency-contract').val,

            // Action name
            name: "transfer",
            
            // Action parameters
            data: {
              // Sender
              from: session.auth.actor,

              // Receiver
              to: to,

              // 4 is precision, XPR is symbol
              quantity: parseFloat($('#amount-input').val()).toFixed(4)+$('#currency-item').val(),

              // Optional memo
              memo: ""
            },
            authorization: [session.auth]
          }]
        }, {
          broadcast: true
        })
      }

      
      // Add button listeners
      logoutIcon.addEventListener("click", logout)
      loginButton.addEventListener("click", () => login(false))
      transferButton.addEventListener("click", () => transfer({
        to: toInput.value,
        amount: amountInput.value,
      }))

      // Restore
      login(true)
    </script>
  </body>
</html>