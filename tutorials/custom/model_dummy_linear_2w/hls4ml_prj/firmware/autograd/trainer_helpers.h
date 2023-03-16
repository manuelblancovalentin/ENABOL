#ifndef TRAINER_HELPERS_H_
#define TRAINER_HELPERS_H_

#include <stdio.h>
#include <stdlib.h>

namespace autograd {

// [@manuelbv]: print_header
void print_trainer_table_header(void) {
    std::cout << ".------------+------------+------------+------------+------------+------------+------------+------------+------------+" << std::endl;
    std::cout << "| Sample     | Epoch      | Batch size | grads[0]   | w[0]       | Loss       | Input[0]   | Pred[0]    | Grnd tr[0] |" << std::endl;
    std::cout << "+------------+------------+------------+------------+------------+------------+------------+------------+------------+" << std::endl;
}

// [@manuelbv]: print table entry
template<typename T>
void print_trainer_table_entry(T input) {
    std::cout << "| " << input << " |";
    // printf("message: '%.3s'", input);
}


} // namespace autograd

#endif