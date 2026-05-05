import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var dados = Provider.of<HabitProvider>(context);

    final verdeEscuro = const Color(0xFF2D6A4F);
    final verdeClaro = const Color(0xFF74C69D);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF9),

      appBar: AppBar(
        title: Text(dados.telaSelecionada == 1 ? "Meus Hábitos" : "EcoTracker"),
        backgroundColor: verdeEscuro,
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2D6A4F)),
              child: Text("EcoTracker",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              title: const Text("Dashboard"),
              onTap: () {
                dados.mudarAba(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Hábitos"),
              onTap: () {
                dados.mudarAba(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Configurações"),
              onTap: () {
                dados.mudarAba(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: dados.telaSelecionada == 0
          ? telaInicio(dados, verdeClaro)
          : dados.telaSelecionada == 1
              ? telaLista(dados, verdeEscuro)
              : telaAjustes(dados),

      floatingActionButton: dados.telaSelecionada == 1
          ? FloatingActionButton(
              backgroundColor: verdeEscuro,
              child: const Icon(Icons.add),
              onPressed: () => mostrarDialogo(context),
            )
          : null,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: dados.telaSelecionada,
        selectedItemColor: verdeEscuro,
        onTap: dados.mudarAba,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Hábitos"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ajustes"),
        ],
      ),
    );
  }

  Widget telaInicio(HabitProvider d, Color verdeClaro) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Olá, Carol! 👋",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const Text("Vamos continuar fazendo a diferença hoje?"),
            const SizedBox(height: 20),

            Row(children: [
              card("Concluídos", d.listaConcluidos.length.toString(), Colors.green),
              const SizedBox(width: 10),
              card("Pendentes", d.listaPendentes.length.toString(), Colors.orange),
            ]),

            const SizedBox(height: 10),

            Row(children: [
              card("Pontos", (d.listaConcluidos.length * 20).toString(), const Color(0xFF2D6A4F)),
              const SizedBox(width: 10),
              card("Meta", "60%", verdeClaro),
            ]),
          ],
        ),
      );

  Widget telaLista(HabitProvider d, Color verde) => DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: verde,
              tabs: const [
                Tab(text: "Pendentes"),
                Tab(text: "Concluídos"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      for (var h in d.listaPendentes)
                        ListTile(
                          title: Text(h),
                          trailing: IconButton(
                            icon: const Icon(Icons.check, color: Colors.green),
                            onPressed: () => d.finalizarHabito(h),
                          ),
                        ),
                    ],
                  ),
                  ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      for (var h in d.listaConcluidos)
                        ListTile(
                          title: Text(h,
                              style: const TextStyle(color: Colors.grey)),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // ✅ AJUSTES ARRUMADO (centralizado)
  Widget telaAjustes(HabitProvider d) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: d.resetarTudo,
                child: const Text("Resetar"),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: d.alternarTema,
                child: const Text("Modo Escuro"),
              ),
            ),
          ],
        ),
      );

  void mostrarDialogo(BuildContext context) {
    var c = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Novo hábito"),
        content: TextField(controller: c),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar")),
          ElevatedButton(
            onPressed: () {
              Provider.of<HabitProvider>(context, listen: false)
                  .adicionarHabito(c.text);
              Navigator.pop(context);
            },
            child: const Text("Adicionar"),
          ),
        ],
      ),
    );
  }

  Widget card(String t, String v, Color c) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(t),
              Text(v,
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: c)),
            ],
          ),
        ),
      );
}