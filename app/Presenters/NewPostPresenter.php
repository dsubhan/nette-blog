<?php
namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;

final class NewPostPresenter extends Nette\Application\UI\Presenter
{
	
	private $database;

	public function __construct(Nette\Database\Context $database)
	{
			$this->database = $database;
	}

    public function startup(): void
    {
        parent::startup();

        if (!$this->getUser()->isLoggedIn()) {
            $this->redirect('Sign:in');
        }
    }
	
    protected function createComponentNewPost(): Form
	{
		$form = new Form;
		$form->addText('title', 'Název příspěvku:')
			->setRequired();

		$form->addTextArea('text', 'Content:')
            ->setRequired();

		$form->addSubmit('send', 'Publikovat nový příspěvek');
		$form->onSuccess[] = [$this, 'form_ok'];

		return $form;
	}

    public function form_ok(\stdClass $data): void
	{
		$this->database->table('posts')->insert([
			'title' => $data->title,
			'content' => $data->text,
			'created_at' => date("Y-m-d h:i:s"),
			'aktivni' => 0,
		]);

		$this->flashMessage('Příspěvek byl založen, nyní čekejte pro schválení publikace', 'success');
		$this->redirect('Homepage:');
	}


}