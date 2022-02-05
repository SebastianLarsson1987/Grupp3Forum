<template>
    <div>
        <form
            class="threadmessages-wrapper-form"
            v-for="item in oneThreadAndMessages2"
            :key="item.id"
        >
            <div class="threadmessages-wrapper-form-threadAndMessages">
                <div class="threadmessages-wrapper-form-thread">
                    <ul>
                        <li class="threadmessages-wrapper-form-thread-list">
                            <h1>{{ item.topic }}</h1>
                            <i>Tråd Skapad {{ item.createadAt }}</i>
                            <i>Tråd senast uppdaterad {{ item.updatedAt }}</i>
                        </li>
                    </ul>
                </div>
                <div class="threadmessages-wrapper-form-messages-scroll">
                    <div
                        class="threadmessages-wrapper-form-messages"
                        v-for="message in paginatedData"
                        :key="message.id"
                    >
                        <div>
                            <ul>
                                <li class="threadmessages-wrapper-form-messages-list">
                                    <div class="threadmessages-wrapper-form-messages-list-header">
                                        <i>Skapad {{ message.createdAt }}</i>
                                        <i>Uppdaterad {{ message.updatedAt }}</i>
                                        <i>#{{ message.id }}</i>
                                    </div>
                                    <div class="threadmessages-wrapper-form-messages-list-content">
                                        <i>Medlem: {{ message.userU.userName }}</i>
                                        <p>{{ message.text }}</p>
                                    </div>
                                    <div v-if="item.userUid === uid">
                                        <button @click="removeMessage(message.id)">Ta bort innehåll</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="threadmessages-wrapper-form-messages-scroll-buttons">
                        <button type="button" @click="firstPage" :disabled="pageNumber === 0">
                            <i class="fas fa-angle-double-left"></i>
                        </button>
                        <button type="button" @click="prevPage" :disabled="pageNumber === 0">
                            <i class="fas fa-chevron-left"></i>
                        </button>
                        <p>sida {{ pageNumber + 1 }} av {{ pageCount }}</p>
                        <button
                            type="button"
                            @click="nextPage"
                            :disabled="pageNumber >= pageCount - 1"
                        >
                            <i class="fas fa-chevron-right"></i>
                        </button>
                        <button
                            type="button"
                            @click="lastPage"
                            :disabled="pageNumber >= pageCount - 1"
                        >
                            <i class="fas fa-angle-double-right"></i>
                        </button>
                    </div>
                </div>
                <div class="threadmessages-wrapper-form-messages-writeMessage">
                    <div v-if="!writeMessageDisabled">
                        <textarea
                            class="threadmessages-wrapper-form-messages-writeMessage-textArea"
                            rows="5"
                            cols="100"
                            placeholder="Skriv ditt meddelande här..."
                            v-model="newMessage.mtext"
                        ></textarea>
                        <button @click="postMessage()">Skapa meddelande</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>

<script>

import { auth } from "../../assets/js/firebase";

export default {

    props: {
        size: {
            type: Number,
            required: false,
            default: 10
        }
    },
    data() {
        return {
            newMessage: {
                mtext: "",
            },
            messages: this.$store.getters.getMessages,
            pageNumber: 0,
            writeMessageDisabled: false

        }
    },

    computed: {

        oneThreadAndMessages2: {
            get() {
                return this.$store.state.oneThreadAndMessages
            },
            set(value) {
                this.$store.commit('setOneThreadAndMessages', value)
            }
        },

        pageCount() {
            let l = this.$store.state.messages.length,
                s = this.size;
            return Math.ceil(l / s);
        },
        paginatedData() {
            const start = this.pageNumber * this.size,
                end = start + this.size;

            let array = this.$store.state.messages.slice(start, end)
                .sort((a, b) => a.updatedAt - b.updatedAt);
            console.log("paginateddata", array)
            return array;
        },
        uid() {
            let user = auth.currentUser;
            if (!user) {
                return console.log("not logged in")
            }
            else {
                return user.uid
            }

        },

        banned() {
            return this.$store.state.bannedUser
        }



    },

    methods: {
        async getOneThreadAndMessages(id) {
            this.threadAndMessages = await this.$store.dispatch('getThreadAndMessagesById', id);
            return this.threadAndMessages;
        },


        postMessage() {

            let payload = {
                mtext: this.newMessage.mtext,
                threadId: this.$route.params.id,
                userId: auth.currentUser.uid
            };
            if (payload.mtext == "") {
                return alert("Fältet får inte vara tomt");
            }
            else {
                return this.$store.dispatch('postMessageInThread', payload);
            }


        },


        nextPage() {
            this.pageNumber++;
        },
        prevPage() {
            this.pageNumber--;
        },
        lastPage() {
            let length = this.$store.state.messages.length
            let size = this.size;

            let pageCount = Math.ceil(length / size);

            this.pageNumber = pageCount - 1;
            return this.pageNumber;

        },
        firstPage() {
            this.pageNumber = 0;
        },

        stateChanged() {
            auth.onAuthStateChanged(user => {
                if (!user) {
                    this.writeMessageDisabled = true;
                    this.uid == user.uid;
                }
            })
        },
        async removeMessage(id) {
            await this.$store.dispatch("deleteMessage", id);
            messages = messages.filter(m => m.id != id);
        }



    },

    created() {

        this.getOneThreadAndMessages(this.$route.params.id);
        this.stateChanged();

    }



}
</script>

<style scoped>
.threadmessages-wrapper-form {
    margin: 0 auto;
    border: 1px solid black;
    width: 80vw;
    height: 80vh;
    border-radius: 20px;
}
.threadmessages-wrapper-form-thread {
    border: 1px solid black;
    border-top-right-radius: 20px;
    border-top-left-radius: 20px;
    height: 10vh;
}

.threadmessages-wrapper-form-messages-scroll {
    overflow-x: hidden;
    overflow-y: auto;
    text-align: justify;
    height: 50vh;
}

.threadmessages-wrapper-form-messages-scroll-buttons > button {
    display: block;
    margin: 0 auto;
}
.threadmessages-wrapper-form-messages-scroll-buttons {
    display: flex;
    flex-direction: row;
}

.threadmessages-wrapper-form-thread-list > i {
    display: flex;
    flex-direction: row;
    font-size: 70%;
}

.threadmessages-wrapper-form-messages-list {
    margin: 0 auto;
    margin-left: 1vw;
    margin-top: 0.5vw;
}

.threadmessages-wrapper-form-messages-list > div {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    width: 77vw;
    border: 1px solid black;
}

.threadmessages-wrapper-form-messages-list > div > i {
    font-size: 70%;
}

.threadmessages-wrapper-form-messages-list > div > i:nth-child(2) {
    margin-right: 2vw;
}

.threadmessages-wrapper-form-messages-list-content > p {
    margin-left: 1vw;
    inline-size: 70vw;
    overflow-wrap: break-word;
}

.threadmessages-wrapper-form-messages-list-content > i {
    border-right: 1px solid black;
    width: 10vw;
    background-color: aliceblue;
}

.threadmessages-wrapper-form-messages-writeMessage {
    border: 1px solid black;
    height: 20vh;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
}

.threadmessages-wrapper-form-messages-writeMessage-textArea {
    resize: none;
    display: block;
    margin: 0 auto;
    margin-top: 2vh;
}

.threadmessages-wrapper-form-messages-writeMessage > div {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.threadmessages-wrapper-form-messages-writeMessage > div > button {
    width: 55%;
}
</style>