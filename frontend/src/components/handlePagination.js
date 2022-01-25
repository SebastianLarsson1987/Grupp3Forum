import {ref, computed} from 'vue'

export default function handlePagination(results){
    let page = ref(1);

    results.map((item) => {
        return { index: item, value: `this_${item}` };
      });
    
      const perPage = 1;
    
      const paginatedData = computed(() =>
        results.slice((page.value - 1) * perPage, page.value * perPage)
      );
    
      const nextPage = () => {
        if (page.value !== Math.ceil(results.length / perPage)) {
          page.value += 1;
        }
      };
    
      const backPage = () => {
        if (page.value !== 1) {
          page.value -= 1;
        }
      };
    
      const goToPage = (numPage) => {
        page.value = numPage;
      };
    
      return { results, paginatedData, perPage, page, nextPage, backPage, goToPage };
    
}
