<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>infinix Client | Brookhaven Rp | Português</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #0a0a0a;
            color: #fff;
            overflow: hidden;
            height: 100vh;
        }
        
        .floating-icon {
            position: fixed;
            top: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            background-color: #1a1a1a;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: move;
            z-index: 10000;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            font-size: 24px;
            user-select: none;
        }
        
        .menu-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 700px;
            height: 450px;
            background-color: #111;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
            display: none;
            z-index: 10001;
        }
        
        .header {
            height: 35px;
            background-color: #090909;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 15px;
            cursor: move;
            user-select: none;
        }
        
        .title {
            font-size: 14px;
            font-weight: 500;
            color: #eee;
        }
        
        .window-controls {
            display: flex;
        }
        
        .window-btn {
            width: 30px;
            height: 20px;
            border-radius: 3px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 5px;
            cursor: pointer;
            font-size: 12px;
            font-weight: bold;
            color: #fff;
        }
        
        .minimize {
            background-color: #333;
        }
        
        .close {
            background-color: #ff5555;
        }
        
        .content {
            display: flex;
            height: calc(100% - 35px);
        }
        
        .sidebar {
            width: 180px;
            background-color: #131313;
            padding: 20px 0;
            height: 100%;
        }
        
        .menu-btn {
            padding: 12px 20px;
            cursor: pointer;
            transition: background-color 0.2s;
            font-size: 14px;
            display: flex;
            align-items: center;
            color: #ddd;
        }
        
        .menu-btn.active {
            background-color: #1a1a1a;
            border-left: 3px solid #4CAF50;
        }
        
        .menu-btn:hover {
            background-color: #1a1a1a;
        }
        
        .main-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }
        
        .section {
            display: none;
        }
        
        .section.active {
            display: block;
        }
        
        h2 {
            font-size: 18px;
            margin-bottom: 15px;
            color: #fff;
        }
        
        p {
            color: #bbb;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: #3e8e41;
        }
        
        .protection-item {
            margin-bottom: 15px;
        }
        
        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
            margin-right: 10px;
        }
        
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #333;
            transition: .4s;
            border-radius: 24px;
        }
        
        .slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 3px;
            bottom: 3px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        
        input:checked + .slider {
            background-color: #4CAF50;
        }
        
        input:checked + .slider:before {
            transform: translateX(26px);
        }
        
        .protection-label {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
            color: #ddd;
            font-size: 14px;
        }
        
        .player-list {
            background-color: #1a1a1a;
            border-radius: 6px;
            padding: 10px;
            margin-top: 10px;
            max-height: 150px;
            overflow-y: auto;
        }
        
        .player-item {
            padding: 8px;
            border-radius: 4px;
            margin-bottom: 5px;
            background-color: #222;
            cursor: pointer;
            transition: background-color 0.2s;
            font-size: 13px;
        }
        
        .player-item:hover {
            background-color: #333;
        }
        
        .player-item.selected {
            background-color: #2d572c;
        }
        
        .update-btn {
            background-color: #333;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            margin-top: 10px;
        }
        
        .update-btn:hover {
            background-color: #444;
        }
        
        /* Scrollbar personalizada */
        ::-webkit-scrollbar {
            width: 8px;
        }
        
        ::-webkit-scrollbar-track {
            background: #1a1a1a;
        }
        
        ::-webkit-scrollbar-thumb {
            background: #333;
            border-radius: 4px;
        }
        
        ::-webkit-scrollbar-thumb:hover {
            background: #444;
        }
    </style>
</head>
<body>
    <!-- Ícone flutuante -->
    <div class="floating-icon" id="floatingIcon">🏠</div>
    
    <!-- Container do menu -->
    <div class="menu-container" id="menuContainer">
        <div class="header" id="header">
            <div class="title">infinix Client | Brookhaven Rp | Português</div>
            <div class="window-controls">
                <div class="window-btn minimize" id="minimizeBtn">-</div>
                <div class="window-btn close" id="closeBtn">X</div>
            </div>
        </div>
        
        <div class="content">
            <!-- Menu lateral -->
            <div class="sidebar">
                <div class="menu-btn active" data-section="home">Início</div>
                <div class="menu-btn" data-section="protection">Proteção</div>
                <div class="menu-btn" data-section="troll">Troll</div>
            </div>
            
            <!-- Conteúdo principal -->
            <div class="main-content">
                <!-- Seção Início -->
                <div class="section active" id="home-section">
                    <h2>infinix Hub | Community</h2>
                    <p>Junte-se a nossa comunidade discord para comprar um designer</p>
                    <button class="btn" id="discordBtn">Join</button>
                </div>
                
                <!-- Seção Proteção -->
                <div class="section" id="protection-section">
                    <h2>Proteção</h2>
                    
                    <div class="protection-item">
                        <label class="protection-label">
                            <div class="switch">
                                <input type="checkbox" id="antVoid">
                                <span class="slider"></span>
                            </div>
                            ANT VOID
                        </label>
                    </div>
                    
                    <div class="protection-item">
                        <label class="protection-label">
                            <div class="switch">
                                <input type="checkbox" id="antSit">
                                <span class="slider"></span>
                            </div>
                            ANT SIT
                        </label>
                    </div>
                    
                    <div class="protection-item">
                        <label class="protection-label">
                            <div class="switch">
                                <input type="checkbox" id="antScript">
                                <span class="slider"></span>
                            </div>
                            ANT SCRIPT
                        </label>
                    </div>
                </div>
                
                <!-- Seção Troll -->
                <div class="section" id="troll-section">
                    <h2>TROLL</h2>
                    
                    <button class="btn" id="bugServerBtn">Bugar Servidor (Todos Players)</button>
                    
                    <div style="margin-top: 20px;">
                        <h3>BUGAR JOGADOR SELECIONADO</h3>
                        
                        <div class="player-list" id="playerList">
                            <div class="player-item">Jogador 1</div>
                            <div class="player-item">Jogador 2</div>
                            <div class="player-item">Jogador 3</div>
                            <div class="player-item">Jogador 4</div>
                            <div class="player-item">Jogador 5</div>
                        </div>
                        
                        <button class="update-btn" id="updatePlayersBtn">ATUALIZAR PLAYERS</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Elementos do DOM
            const floatingIcon = document.getElementById('floatingIcon');
            const menuContainer = document.getElementById('menuContainer');
            const minimizeBtn = document.getElementById('minimizeBtn');
            const closeBtn = document.getElementById('closeBtn');
            const menuBtns = document.querySelectorAll('.menu-btn');
            const sections = document.querySelectorAll('.section');
            const discordBtn = document.getElementById('discordBtn');
            const bugServerBtn = document.getElementById('bugServerBtn');
            const updatePlayersBtn = document.getElementById('updatePlayersBtn');
            const playerItems = document.querySelectorAll('.player-item');
            const header = document.getElementById('header');
            
            // Link do Discord
            const discordLink = 'https://discord.gg/XT8DFw2QsG';
            
            // Mostrar/ocultar menu ao clicar no ícone flutuante
            floatingIcon.addEventListener('click', function() {
                menuContainer.style.display = 'block';
            });
            
            // Minimizar menu
            minimizeBtn.addEventListener('click', function() {
                menuContainer.style.display = 'none';
            });
            
            // Fechar menu
            closeBtn.addEventListener('click', function() {
                menuContainer.style.display = 'none';
            });
            
            // Alternar entre seções do menu
            menuBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    // Remover classe active de todos os botões
                    menuBtns.forEach(b => b.classList.remove('active'));
                    // Adicionar classe active ao botão clicado
                    this.classList.add('active');
                    
                    // Ocultar todas as seções
                    sections.forEach(section => section.classList.remove('active'));
                    
                    // Mostrar a seção correspondente
                    const sectionId = this.getAttribute('data-section') + '-section';
                    document.getElementById(sectionId).classList.add('active');
                });
            });
            
            // Copiar link do Discord
            discordBtn.addEventListener('click', function() {
                navigator.clipboard.writeText(discordLink)
                    .then(() => {
                        alert('Link do Discord copiado: ' + discordLink);
                    })
                    .catch(err => {
                        console.error('Erro ao copiar o link: ', err);
                    });
            });
            
            // Bugar servidor (todos players)
            bugServerBtn.addEventListener('click', function() {
                alert('Todos os players estão bugados (pulando sem parar), exceto você!');
                // Aqui viria o código real para executar a função no jogo
            });
            
            // Atualizar lista de players
            updatePlayersBtn.addEventListener('click', function() {
                alert('Lista de players atualizada!');
                // Aqui viria o código real para atualizar a lista de jogadores
            });
            
            // Selecionar jogador
            playerItems.forEach(item => {
                item.addEventListener('click', function() {
                    playerItems.forEach(i => i.classList.remove('selected'));
                    this.classList.add('selected');
                });
            });
            
            // Tornar o menu arrastável
            let isDragging = false;
            let currentX;
            let currentY;
            let initialX;
            let initialY;
            let xOffset = 0;
            let yOffset = 0;
            
            header.addEventListener("mousedown", dragStart);
            header.addEventListener("mouseup", dragEnd);
            header.addEventListener("mousemove", drag);
            
            floatingIcon.addEventListener("mousedown", dragStartIcon);
            floatingIcon.addEventListener("mouseup", dragEnd);
            floatingIcon.addEventListener("mousemove", dragIcon);
            
            function dragStart(e) {
                initialX = e.clientX - xOffset;
                initialY = e.clientY - yOffset;
                
                if (e.target === header) {
                    isDragging = true;
                }
            }
            
            function dragStartIcon(e) {
                initialX = e.clientX - xOffset;
                initialY = e.clientY - yOffset;
                
                if (e.target === floatingIcon) {
                    isDragging = true;
                }
            }
            
            function dragEnd() {
                initialX = currentX;
                initialY = currentY;
                
                isDragging = false;
            }
            
            function drag(e) {
                if (isDragging) {
                    e.preventDefault();
                    
                    currentX = e.clientX - initialX;
                    currentY = e.clientY - initialY;
                    
                    xOffset = currentX;
                    yOffset = currentY;
                    
                    setTranslate(currentX, currentY, menuContainer);
                }
            }
            
            function dragIcon(e) {
                if (isDragging) {
                    e.preventDefault();
                    
                    currentX = e.clientX - initialX;
                    currentY = e.clientY - initialY;
                    
                    xOffset = currentX;
                    yOffset = currentY;
                    
                    setTranslate(currentX, currentY, floatingIcon);
                }
            }
            
            function setTranslate(xPos, yPos, el) {
                el.style.transform = "translate3d(" + xPos + "px, " + yPos + "px, 0)";
            }
        });
    </script>
</body>
</html>
